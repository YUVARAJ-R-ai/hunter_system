import json
import urllib.request
import os

def escape_sql_string(val):
    if val is None:
        return 'NULL'
    # Replace single quotes with two single quotes
    escaped = val.replace("'", "''")
    return f"'{escaped}'"

def format_sql_array(arr):
    if not arr:
        return 'NULL'
    # Format array elements for PostgreSQL array syntax: ARRAY['val1', 'val2']
    elements = []
    for x in arr:
        escaped = x.replace("'", "''")
        elements.append(f"'{escaped}'")
    return f"ARRAY[{', '.join(elements)}]::TEXT[]"

def map_muscle_to_body_part(muscle):
    m = (muscle or '').lower()
    if m in ['chest', 'pectoralis major', 'pectoralis']:
        return 'Chest'
    if m in ['lats', 'traps', 'middle back', 'lower back', 'latissimus dorsi', 'trapezius', 'rhomboids', 'back']:
        return 'Back'
    if m in ['shoulders', 'deltoids', 'deltoid', 'anterior deltoid', 'lateral deltoid', 'posterior deltoid']:
        return 'Shoulders'
    if m in ['biceps', 'triceps', 'forearms', 'brachialis', 'wrist', 'arms']:
        if 'tricep' in m: return 'Triceps'
        if 'bicep' in m: return 'Biceps'
        return 'Arms'
    if m in ['quads', 'hamstrings', 'glutes', 'calves', 'quadriceps', 'adductors', 'abductors', 'legs']:
        if 'quad' in m: return 'Quads'
        if 'hamstring' in m: return 'Hamstrings'
        if 'calf' in m or 'calves' in m: return 'Calves'
        return 'Legs'
    if m in ['abs', 'obliques', 'core', 'rectus abdominis']:
        return 'Core'
    if m in ['cardio', 'heart']:
        return 'Cardio'
    return 'Other'

def main():
    json_url = "https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/dist/exercises.json"
    output_file = os.path.join(os.path.dirname(__file__), "seed_exercises.sql")
    
    print(f"Fetching exercises dataset from: {json_url}")
    try:
        with urllib.request.urlopen(json_url, timeout=15) as response:
            data = json.loads(response.read().decode('utf-8'))
    except Exception as e:
        print(f"Error fetching data: {e}")
        return

    print(f"Loaded {len(data)} exercises. Generating SQL...")

    sql_statements = []
    sql_statements.append("-- Seed Exercises Library from yuhonas/free-exercise-db\n")
    
    for item in data:
        name = item.get('name') or ''
        # Map target muscle and body part to lowercase/title case appropriately
        primary_muscles = item.get('primaryMuscles') or []
        target_muscle = primary_muscles[0].capitalize() if primary_muscles else 'General'
        body_part = map_muscle_to_body_part(target_muscle)
        equipment = (item.get('equipment') or '').capitalize()
        # Create a mock GIF url or use their image path. yuhonas/free-exercise-db uses local images
        # e.g., image path: exercises/3_4_Sit-Up/0.jpg. We can map it to github raw link:
        # https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/{name}/0.jpg
        # Or we can use their image paths if we want.
        image_path = ""
        images = item.get('images') or []
        if images:
            image_path = f"https://raw.githubusercontent.com/yuhonas/free-exercise-db/main/exercises/{images[0]}"
        
        # yuhonas instructions is a list of strings
        instructions = item.get('instructions') or []
        
        # Generate stable external ID based on name or ID if available
        external_id = item.get('id') or name.lower().replace(' ', '_')
        
        # Prepare values
        name_esc = escape_sql_string(name)
        target_esc = escape_sql_string(target_muscle)
        body_esc = escape_sql_string(body_part)
        equip_esc = escape_sql_string(equipment)
        gif_esc = escape_sql_string(image_path)
        
        secondary_muscles = item.get('secondaryMuscles') or []
        secondary_arr = format_sql_array([(m or '').capitalize() for m in secondary_muscles if m])
        inst_arr = format_sql_array(instructions)
        ext_esc = escape_sql_string(external_id)
        
        stmt = f"""INSERT INTO public.exercises (name, target_muscle, body_part, equipment, gif_url, secondary_muscles, instructions, external_id, user_id)
VALUES ({name_esc}, {target_esc}, {body_esc}, {equip_esc}, {gif_esc}, {secondary_arr}, {inst_arr}, {ext_esc}, NULL)
ON CONFLICT (external_id) DO UPDATE SET
  name = EXCLUDED.name,
  target_muscle = EXCLUDED.target_muscle,
  body_part = EXCLUDED.body_part,
  equipment = EXCLUDED.equipment,
  gif_url = EXCLUDED.gif_url,
  secondary_muscles = EXCLUDED.secondary_muscles,
  instructions = EXCLUDED.instructions;"""
        sql_statements.append(stmt)

    # Split sql_statements (excluding the header comment) into chunks
    statements_data = sql_statements[1:]
    chunk_size = 200
    for i in range(0, len(statements_data), chunk_size):
        chunk = statements_data[i:i+chunk_size]
        part_num = (i // chunk_size) + 1
        part_file = os.path.join(os.path.dirname(__file__), f"seed_exercises_part{part_num}.sql")
        with open(part_file, 'w', encoding='utf-8') as f:
            f.write(f"-- Seed Exercises Library Part {part_num}\n\n" + '\n'.join(chunk))
        print(f"Generated seed SQL part: {part_file} ({len(chunk)} records)")

if __name__ == "__main__":
    main()
