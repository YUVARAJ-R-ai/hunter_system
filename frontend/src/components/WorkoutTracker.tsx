import React, { useState, useEffect, useRef } from 'react';
import { 
  Dumbbell, Play, Trash2, Plus, Minus, Check, 
  BookOpen, TrendingUp, Clock, Sparkles, PlusSquare, 
  History, Calendar, X, AlertCircle 
} from 'lucide-react';
import { workoutAPI } from '../api/supabaseClient';

interface WorkoutTrackerProps {
  user: any;
  activeWorkout: any;
  setActiveWorkout: (w: any) => void;
  onRefreshUser: () => void;
  triggerNotification: (msg: string) => void;
}

export default function WorkoutTracker({ 
  user, 
  activeWorkout, 
  setActiveWorkout, 
  onRefreshUser,
  triggerNotification 
}: WorkoutTrackerProps) {
  const [subTab, setSubTab] = useState<'templates' | 'exercises' | 'history'>('templates');
  const [templates, setTemplates] = useState<any[]>([]);
  const [exercises, setExercises] = useState<any[]>([]);
  const [logs, setLogs] = useState<any[]>([]);
  const [loading, setLoading] = useState(false);

  // Filter states
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedMuscle, setSelectedMuscle] = useState('ALL');

  // New Template Modal state
  const [showCreateTemplate, setShowCreateTemplate] = useState(false);
  const [templateName, setTemplateName] = useState('');
  const [templateDesc, setTemplateDesc] = useState('');
  const [selectedTemplateExercises, setSelectedTemplateExercises] = useState<any[]>([]);

  // New Custom Exercise state
  const [showAddCustomEx, setShowAddCustomEx] = useState(false);
  const [customExName, setCustomExName] = useState('');
  const [customExMuscle, setCustomExMuscle] = useState('Chest');
  const [customExDesc, setCustomExDesc] = useState('');

  // Active workout logger duration state
  const [secondsElapsed, setSecondsElapsed] = useState(0);
  const [restRemaining, setRestRemaining] = useState(0);
  const [restTotal, setRestTotal] = useState(90);
  const [isRestActive, setIsRestActive] = useState(false);

  const durationTimerRef = useRef<NodeJS.Timeout | null>(null);
  const restTimerRef = useRef<NodeJS.Timeout | null>(null);

  const muscles = ['ALL', 'Chest', 'Back', 'Quads', 'Hamstrings', 'Shoulders', 'Biceps', 'Triceps', 'Core', 'Calves'];

  useEffect(() => {
    fetchTemplatesAndLogs();
  }, []);

  useEffect(() => {
    if (activeWorkout) {
      const start = activeWorkout.startedAt;
      setSecondsElapsed(Math.floor((Date.now() - start) / 1000));
      durationTimerRef.current = setInterval(() => {
        setSecondsElapsed(Math.floor((Date.now() - start) / 1000));
      }, 1000);
    } else {
      if (durationTimerRef.current) clearInterval(durationTimerRef.current);
      setSecondsElapsed(0);
    }
    return () => {
      if (durationTimerRef.current) clearInterval(durationTimerRef.current);
    };
  }, [activeWorkout]);

  // Rest timer tick
  useEffect(() => {
    if (isRestActive && restRemaining > 0) {
      restTimerRef.current = setTimeout(() => {
        setRestRemaining(prev => prev - 1);
      }, 1000);
    } else if (isRestActive && restRemaining === 0) {
      setIsRestActive(false);
      triggerNotification("Rest period finished! Begin your next set!");
    }
    return () => {
      if (restTimerRef.current) clearTimeout(restTimerRef.current);
    };
  }, [isRestActive, restRemaining]);

  const fetchTemplatesAndLogs = async () => {
    setLoading(true);
    try {
      const [tList, eList, lList] = await Promise.all([
        workoutAPI.getTemplates(),
        workoutAPI.getExercises(),
        workoutAPI.getLogs(),
      ]);
      setTemplates(tList);
      setExercises(eList);
      setLogs(lList);
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  const handleStartEmptyWorkout = () => {
    if (activeWorkout) {
      alert("Workout session already in progress.");
      return;
    }
    setActiveWorkout({
      name: 'Empty Workout',
      startedAt: Date.now(),
      exercises: [],
      templateId: null
    });
  };

  const handleStartTemplateWorkout = (tpl: any) => {
    if (activeWorkout) {
      alert("Workout session already in progress.");
      return;
    }
    const prefilledExercises = (tpl.exercises || []).map((te: any) => {
      const ex = te.exercises;
      const setsCount = te.sets_count || 3;
      const repsTarget = te.reps_target || 10;
      return {
        exercise: ex,
        sets: Array.from({ length: setsCount }, (_, i) => ({
          set_number: i + 1,
          weight: 0,
          reps: repsTarget,
          rpe: '',
          is_warmup: false,
          is_completed: false
        }))
      };
    });

    setActiveWorkout({
      name: tpl.name,
      startedAt: Date.now(),
      exercises: prefilledExercises,
      templateId: tpl.id
    });
  };

  const handleAddExerciseToActive = (ex: any) => {
    if (!activeWorkout) return;
    const newEx = {
      exercise: ex,
      sets: [{
        set_number: 1,
        weight: 0,
        reps: 10,
        rpe: '',
        is_warmup: false,
        is_completed: false
      }]
    };
    setActiveWorkout({
      ...activeWorkout,
      exercises: [...activeWorkout.exercises, newEx]
    });
  };

  const handleRemoveExerciseFromActive = (idx: number) => {
    const list = [...activeWorkout.exercises];
    list.splice(idx, 1);
    setActiveWorkout({ ...activeWorkout, exercises: list });
  };

  const handleAddSetToActive = (exIdx: number) => {
    const list = [...activeWorkout.exercises];
    const sets = list[exIdx].sets;
    const lastSet = sets[sets.length - 1];
    sets.push({
      set_number: sets.length + 1,
      weight: lastSet ? lastSet.weight : 0,
      reps: lastSet ? lastSet.reps : 10,
      rpe: '',
      is_warmup: false,
      is_completed: false
    });
    setActiveWorkout({ ...activeWorkout, exercises: list });
  };

  const handleRemoveSetFromActive = (exIdx: number, setIdx: number) => {
    const list = [...activeWorkout.exercises];
    const sets = list[exIdx].sets;
    sets.splice(setIdx, 1);
    if (sets.length === 0) {
      list.splice(exIdx, 1);
    } else {
      // Re-index sets
      sets.forEach((s: any, idx: number) => s.set_number = idx + 1);
    }
    setActiveWorkout({ ...activeWorkout, exercises: list });
  };

  const handleUpdateSetField = (exIdx: number, setIdx: number, field: string, value: any) => {
    const list = [...activeWorkout.exercises];
    list[exIdx].sets[setIdx][field] = value;
    setActiveWorkout({ ...activeWorkout, exercises: list });
  };

  const handleToggleSetComplete = (exIdx: number, setIdx: number) => {
    const list = [...activeWorkout.exercises];
    const set = list[exIdx].sets[setIdx];
    const completed = !set.is_completed;
    set.is_completed = completed;
    setActiveWorkout({ ...activeWorkout, exercises: list });

    if (completed) {
      // Start 90s rest timer
      setRestTotal(90);
      setRestRemaining(90);
      setIsRestActive(true);
    }
  };

  const handleSaveWorkout = async () => {
    if (!activeWorkout) return;
    if (activeWorkout.exercises.length === 0) {
      alert("Please add at least one exercise.");
      return;
    }

    setLoading(true);
    try {
      const completedAt = new Date().toISOString();
      const startedAtStr = new Date(activeWorkout.startedAt).toISOString();
      const durationSeconds = Math.floor((Date.now() - activeWorkout.startedAt) / 1000);

      // Volume calculation
      let totalVolume = 0;
      const flatSets: any[] = [];
      activeWorkout.exercises.forEach((ex: any) => {
        ex.sets.forEach((s: any) => {
          if (s.is_completed) {
            totalVolume += (Number(s.weight) || 0) * (Number(s.reps) || 0);
          }
          flatSets.push({
            exercise_id: ex.exercise.id,
            weight: Number(s.weight) || 0,
            reps: Number(s.reps) || 0,
            rpe: s.rpe ? Number(s.rpe) : null,
            is_warmup: s.is_warmup,
            is_completed: s.is_completed,
            set_number: s.set_number
          });
        });
      });

      await workoutAPI.createLog(
        activeWorkout.name,
        activeWorkout.templateId,
        startedAtStr,
        completedAt,
        durationSeconds,
        totalVolume,
        flatSets
      );

      triggerNotification(`Workout logged! S-Rank performance. +100 XP +50 Gold.`);
      setActiveWorkout(null);
      onRefreshUser();
      fetchTemplatesAndLogs();
    } catch (e) {
      console.error(e);
      alert("Error saving workout log.");
    } finally {
      setLoading(false);
    }
  };

  const handleCreateTemplate = async () => {
    if (!templateName || selectedTemplateExercises.length === 0) {
      alert("Enter a routine name and add exercises.");
      return;
    }
    try {
      await workoutAPI.createTemplate(
        templateName,
        templateDesc,
        selectedTemplateExercises.map(ex => ({
          exercise_id: ex.id,
          sets_count: 3,
          reps_target: 10
        }))
      );
      setShowCreateTemplate(false);
      setTemplateName('');
      setTemplateDesc('');
      setSelectedTemplateExercises([]);
      fetchTemplatesAndLogs();
      triggerNotification("Routine template saved successfully.");
    } catch (e) {
      console.error(e);
      alert("Failed to save template.");
    }
  };

  const handleCreateCustomExercise = async () => {
    if (!customExName) return;
    try {
      await workoutAPI.createCustomExercise(customExName, customExMuscle, customExDesc);
      setCustomExName('');
      setCustomExDesc('');
      setShowAddCustomEx(false);
      fetchTemplatesAndLogs();
      triggerNotification("Custom exercise created successfully.");
    } catch (e) {
      console.error(e);
      alert("Failed to create exercise.");
    }
  };

  const handleDeleteTemplate = async (id: string, e: React.MouseEvent) => {
    e.stopPropagation();
    if (!confirm("Are you sure you want to delete this routine?")) return;
    try {
      await workoutAPI.deleteTemplate(id);
      fetchTemplatesAndLogs();
    } catch (err) {
      console.error(err);
    }
  };

  // SVG Volume Chart builder
  const renderVolumeChart = () => {
    if (logs.length < 2) return null;
    const historyLogs = [...logs].reverse();
    const volumes = historyLogs.map(l => Number(l.total_volume_kg) || 0);
    const maxVol = Math.max(...volumes) || 1;
    const minVol = Math.min(...volumes) || 0;
    const range = maxVol - minVol || 1;

    const width = 600;
    const height = 150;
    const padding = 20;

    const points = historyLogs.map((l, idx) => {
      const x = padding + (idx * (width - padding * 2)) / (historyLogs.length - 1);
      const y = height - padding - (((Number(l.total_volume_kg) || 0) - minVol) / range) * (height - padding * 2);
      return { x, y };
    });

    const pathData = points.reduce((acc, p, idx) => {
      return acc + (idx === 0 ? `M ${p.x} ${p.y}` : ` L ${p.x} ${p.y}`);
    }, '');

    return (
      <div className="w-full bg-[#120f26]/60 border border-white/5 p-4 rounded-xl space-y-2">
        <div className="text-[10px] font-orbitron font-bold text-accent-blue tracking-widest uppercase">
          Volume Progress Trend (kg)
        </div>
        <div className="overflow-x-auto">
          <svg viewBox={`0 0 ${width} ${height}`} className="w-full min-w-[400px]">
            <defs>
              <linearGradient id="chartGlow" x1="0" y1="0" x2="0" y2="1">
                <stop offset="0%" stopColor="#00F2FF" stopOpacity="0.3" />
                <stop offset="100%" stopColor="#00F2FF" stopOpacity="0.0" />
              </linearGradient>
            </defs>
            {/* Grid horizontal lines */}
            {[0, 1, 2, 3].map((n) => {
              const y = padding + (n * (height - padding * 2)) / 3;
              return (
                <line key={n} x1={padding} y1={y} x2={width - padding} y2={y} stroke="rgba(255,255,255,0.03)" strokeWidth="1" />
              );
            })}

            {/* Glowing fill */}
            {points.length > 1 && (
              <path 
                d={`${pathData} L ${points[points.length - 1].x} ${height - padding} L ${points[0].x} ${height - padding} Z`} 
                fill="url(#chartGlow)" 
              />
            )}

            {/* Main line */}
            <path d={pathData} fill="none" stroke="#1E90FF" strokeWidth="2.5" strokeLinecap="round" />

            {/* Point circles */}
            {points.map((p, idx) => (
              <g key={idx} className="group cursor-pointer">
                <circle cx={p.x} cy={p.y} r="5" fill="#00F2FF" />
                <circle cx={p.x} cy={p.y} r="2" fill="white" />
                <title>{`Volume: ${volumes[idx]} kg\nDate: ${new Date(historyLogs[idx].completed_at).toLocaleDateString()}`}</title>
              </g>
            ))}
          </svg>
        </div>
      </div>
    );
  };

  const filteredExercises = exercises.filter(item => {
    const nameMatches = (item.name || '').toLowerCase().includes(searchQuery.toLowerCase());
    const muscleMatches = selectedMuscle === 'ALL' || item.target_muscle.toUpperCase() === selectedMuscle.toUpperCase();
    return nameMatches && muscleMatches;
  });

  const formatSeconds = (totalSec: number) => {
    const mins = Math.floor(totalSec / 60);
    const secs = totalSec % 60;
    return `${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}`;
  };

  return (
    <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
      {/* Templates / Controls column */}
      <div className="md:col-span-2 space-y-6">
        {/* Sub Nav tabs */}
        <div className="flex gap-2 bg-[#120f26]/80 p-1 border border-white/5 rounded-lg">
          <button 
            onClick={() => setSubTab('templates')} 
            className={`flex-1 flex items-center justify-center gap-2 py-2 rounded-md font-orbitron font-bold text-xs uppercase transition-all ${subTab === 'templates' ? 'bg-accent-blue text-white' : 'text-white/40 hover:text-white/80'}`}
          >
            <Dumbbell className="w-3.5 h-3.5" />
            Routines
          </button>
          <button 
            onClick={() => setSubTab('exercises')} 
            className={`flex-1 flex items-center justify-center gap-2 py-2 rounded-md font-orbitron font-bold text-xs uppercase transition-all ${subTab === 'exercises' ? 'bg-accent-blue text-white' : 'text-white/40 hover:text-white/80'}`}
          >
            <BookOpen className="w-3.5 h-3.5" />
            Exercises
          </button>
          <button 
            onClick={() => setSubTab('history')} 
            className={`flex-1 flex items-center justify-center gap-2 py-2 rounded-md font-orbitron font-bold text-xs uppercase transition-all ${subTab === 'history' ? 'bg-accent-blue text-white' : 'text-white/40 hover:text-white/80'}`}
          >
            <History className="w-3.5 h-3.5" />
            History Logs
          </button>
        </div>

        {subTab === 'templates' && (
          <div className="space-y-6">
            <div className="flex justify-between items-center">
              <h3 className="font-orbitron font-black text-lg text-white tracking-wider">Saved Routines</h3>
              <button 
                onClick={() => setShowCreateTemplate(true)}
                className="flex items-center gap-2 px-3 py-1.5 bg-accent-blue/10 border border-accent-blue/20 hover:bg-accent-blue/20 text-accent-blue rounded-lg text-xs font-orbitron font-bold transition-all"
              >
                <PlusSquare className="w-4 h-4" />
                CREATE ROUTINE
              </button>
            </div>

            <button 
              onClick={handleStartEmptyWorkout}
              className="w-full flex items-center justify-center gap-2 py-3 bg-[#120f26]/60 border border-dashed border-accent-blue/30 text-accent-blue hover:bg-accent-blue/5 rounded-xl font-orbitron font-bold text-sm tracking-wider uppercase transition-all"
            >
              <Play className="w-4 h-4 fill-accent-blue" />
              START EMPTY WORKOUT
            </button>

            {templates.length === 0 ? (
              <div className="text-center py-12 border border-white/5 rounded-xl text-white/30 text-xs font-orbitron uppercase">
                No routine templates built yet.
              </div>
            ) : (
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                {templates.map((tpl) => (
                  <div 
                    key={tpl.id}
                    className="bg-[#120f26]/60 border border-white/5 p-4 rounded-xl hover:border-accent-blue/20 transition-all flex flex-col justify-between"
                  >
                    <div>
                      <div className="flex justify-between items-start gap-2">
                        <h4 className="font-orbitron font-bold text-white text-sm uppercase">{tpl.name}</h4>
                        <button 
                          onClick={(e) => handleDeleteTemplate(tpl.id, e)}
                          className="text-white/20 hover:text-red-400 transition-colors"
                        >
                          <Trash2 className="w-3.5 h-3.5" />
                        </button>
                      </div>
                      {tpl.description && (
                        <p className="text-[10px] text-white/40 mt-1">{tpl.description}</p>
                      )}
                      
                      <div className="flex flex-wrap gap-1.5 mt-3">
                        {(tpl.exercises || []).map((te: any, i: number) => (
                          <span 
                            key={i} 
                            className="bg-white/5 border border-white/5 px-2 py-0.5 rounded text-[9px] text-white/55 font-mono"
                          >
                            {te.exercises?.name} x{te.sets_count}
                          </span>
                        ))}
                      </div>
                    </div>

                    <button 
                      onClick={() => handleStartTemplateWorkout(tpl)}
                      className="w-full mt-4 flex items-center justify-center gap-2 py-1.5 bg-accent-blue text-white rounded-lg text-xs font-orbitron font-bold hover:bg-accent-blue/80 transition-all uppercase"
                    >
                      <Play className="w-3 h-3 fill-white" />
                      Start Routine
                    </button>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}

        {subTab === 'exercises' && (
          <div className="space-y-6">
            <div className="flex justify-between items-center gap-4">
              <h3 className="font-orbitron font-black text-lg text-white tracking-wider">Exercise Database</h3>
              <button 
                onClick={() => setShowAddCustomEx(true)}
                className="flex items-center gap-2 px-3 py-1.5 bg-accent-purple/10 border border-accent-purple/20 hover:bg-accent-purple/20 text-accent-purple rounded-lg text-xs font-orbitron font-bold transition-all"
              >
                <Plus className="w-4 h-4" />
                NEW MOVEMENT
              </button>
            </div>

            <div className="flex flex-col sm:flex-row gap-4">
              <input 
                type="text" 
                placeholder="Search exercise..."
                value={searchQuery}
                onChange={e => setSearchQuery(e.target.value)}
                className="flex-1 bg-[#120f26]/60 border border-white/5 rounded-xl px-4 py-2 text-sm text-white placeholder-white/20 focus:outline-none focus:border-accent-blue/40"
              />
              <select 
                value={selectedMuscle}
                onChange={e => setSelectedMuscle(e.target.value)}
                className="bg-[#120f26]/60 border border-white/5 rounded-xl px-4 py-2 text-sm text-white focus:outline-none focus:border-accent-blue/40"
              >
                {muscles.map(m => (
                  <option key={m} value={m} className="bg-[#0a0518]">{m}</option>
                ))}
              </select>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 max-h-[500px] overflow-y-auto pr-2">
              {filteredExercises.map((ex) => (
                <div 
                  key={ex.id}
                  className="bg-[#120f26]/60 border border-white/5 p-4 rounded-xl flex items-start justify-between gap-4"
                >
                  <div>
                    <div className="flex items-center gap-2">
                      <span className="font-orbitron font-bold text-xs text-white uppercase">{ex.name}</span>
                      <span className="bg-accent-blue/10 text-accent-blue border border-accent-blue/20 text-[8px] font-orbitron px-2 py-0.5 rounded-full uppercase tracking-wider">
                        {ex.target_muscle}
                      </span>
                    </div>
                    {ex.description && (
                      <p className="text-[10px] text-white/40 mt-1.5 leading-normal">{ex.description}</p>
                    )}
                  </div>
                  {activeWorkout && (
                    <button 
                      onClick={() => handleAddExerciseToActive(ex)}
                      className="px-2 py-1 bg-accent-blue/10 border border-accent-blue/20 hover:bg-accent-blue/25 text-accent-blue text-[9px] font-orbitron font-bold rounded-lg uppercase tracking-wider transition-all"
                    >
                      Add +
                    </button>
                  )}
                </div>
              ))}
            </div>
          </div>
        )}

        {subTab === 'history' && (
          <div className="space-y-6">
            <h3 className="font-orbitron font-black text-lg text-white tracking-wider">Training History</h3>
            
            {/* Chart */}
            {renderVolumeChart()}

            <div className="space-y-4">
              {logs.length === 0 ? (
                <div className="text-center py-12 border border-white/5 rounded-xl text-white/30 text-xs font-orbitron uppercase">
                  No logged workout history found.
                </div>
              ) : (
                logs.map((log) => (
                  <div key={log.id} className="bg-[#120f26]/60 border border-white/5 p-5 rounded-xl space-y-4">
                    <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-2">
                      <div>
                        <h4 className="font-orbitron font-bold text-white uppercase">{log.name}</h4>
                        <div className="flex items-center gap-2 text-[10px] text-white/40 font-mono mt-0.5">
                          <Calendar className="w-3.5 h-3.5" />
                          {new Date(log.completed_at).toLocaleString()}
                        </div>
                      </div>
                      <div className="flex gap-4">
                        <div className="flex items-center gap-1 text-[11px] font-mono text-accent-blue font-bold">
                          <Clock className="w-3.5 h-3.5" />
                          {Math.floor(log.duration_seconds / 60)}m
                        </div>
                        <div className="flex items-center gap-1 text-[11px] font-mono text-accent-cyan font-bold">
                          <Dumbbell className="w-3.5 h-3.5" />
                          {Number(log.total_volume_kg).toFixed(0)} kg
                        </div>
                      </div>
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 pt-2 border-t border-white/5">
                      {Object.entries((log.sets || []).reduce((acc: any, s: any) => {
                        const exName = s.exercises?.name || 'Exercise';
                        if (!acc[exName]) acc[exName] = [];
                        acc[exName].push(s);
                        return acc;
                      }, {})).map(([exName, sets]: [string, any]) => (
                        <div key={exName} className="space-y-1.5">
                          <div className="text-[11px] font-orbitron font-bold text-white/60 uppercase">{exName}</div>
                          <div className="flex flex-wrap gap-1.5">
                            {sets.map((s: any, idx: number) => (
                              <span 
                                key={idx}
                                className="bg-white/5 border border-white/5 px-2 py-0.5 rounded text-[9px] text-white/40 font-mono"
                              >
                                {s.is_warmup ? 'W' : s.set_number}: {s.weight}kg x {s.reps}
                              </span>
                            ))}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                ))
              )}
            </div>
          </div>
        )}
      </div>

      {/* Active Workout logger Column */}
      <div className="md:col-span-1">
        {activeWorkout ? (
          <div className="bg-[#120f26]/80 border border-accent-blue/30 rounded-xl p-5 shadow-[0_0_50px_rgba(30,144,255,0.15)] relative sticky top-6">
            <div className="flex justify-between items-start gap-4">
              <div>
                <input 
                  type="text" 
                  value={activeWorkout.name}
                  onChange={e => setActiveWorkout({ ...activeWorkout, name: e.target.value })}
                  className="bg-transparent font-orbitron font-black text-md text-white uppercase focus:outline-none border-b border-transparent focus:border-white/20 w-full"
                />
                <div className="text-xs font-mono text-accent-blue font-bold flex items-center gap-1.5 mt-1">
                  <Clock className="w-3.5 h-3.5" />
                  {formatSeconds(secondsElapsed)}
                </div>
              </div>
              <button 
                onClick={() => { if (confirm("Discard training session?")) setActiveWorkout(null); }}
                className="text-white/20 hover:text-red-400 transition-colors"
                title="Discard workout"
              >
                <Trash2 className="w-4 h-4" />
              </button>
            </div>

            {/* Rest countdown bar */}
            {isRestActive && (
              <div className="mt-4 bg-accent-blue/10 border border-accent-blue/30 px-3 py-2 rounded-lg flex items-center justify-between text-xs">
                <div className="flex items-center gap-2">
                  <span className="animate-pulse w-2 h-2 rounded-full bg-accent-blue" />
                  <span className="font-orbitron font-bold tracking-wider text-accent-blue">REST: {restRemaining}s</span>
                </div>
                <div className="flex gap-2">
                  <button 
                    onClick={() => setRestRemaining(prev => prev + 30)}
                    className="text-[10px] text-accent-blue font-bold"
                  >
                    +30s
                  </button>
                  <button 
                    onClick={() => { setIsRestActive(false); setRestRemaining(0); }}
                    className="text-[10px] text-white/50 hover:text-white font-bold"
                  >
                    SKIP
                  </button>
                </div>
              </div>
            )}

            <div className="mt-6 space-y-5 max-h-[400px] overflow-y-auto pr-2">
              {activeWorkout.exercises.length === 0 ? (
                <div className="text-center py-12 text-white/20 text-[11px] font-orbitron uppercase border border-dashed border-white/5 rounded-xl">
                  Select exercises from the library to add
                </div>
              ) : (
                activeWorkout.exercises.map((ex: any, exIdx: number) => (
                  <div key={exIdx} className="space-y-2 border-b border-white/5 pb-4 last:border-0 last:pb-0">
                    <div className="flex justify-between items-center">
                      <span className="font-orbitron font-bold text-xs text-white/80 uppercase">{ex.exercise.name}</span>
                      <button 
                        onClick={() => handleRemoveExerciseFromActive(exIdx)}
                        className="text-white/20 hover:text-red-400 transition-colors"
                      >
                        <X className="w-3.5 h-3.5" />
                      </button>
                    </div>

                    <div className="space-y-1.5">
                      {ex.sets.map((set: any, setIdx: number) => (
                        <div key={setIdx} className="flex items-center gap-2">
                          <button 
                            onClick={() => handleUpdateSetField(exIdx, setIdx, 'is_warmup', !set.is_warmup)}
                            className={`w-5 h-5 rounded text-[9px] font-mono font-bold flex items-center justify-center border transition-all ${set.is_warmup ? 'bg-accent-purple/20 border-accent-purple text-accent-purple' : 'border-white/10 text-white/40'}`}
                          >
                            {set.is_warmup ? 'W' : set.set_number}
                          </button>
                          
                          <input 
                            type="number" 
                            placeholder="kg"
                            value={set.weight || ''}
                            onChange={e => handleUpdateSetField(exIdx, setIdx, 'weight', e.target.value)}
                            className="w-16 bg-white/5 border border-white/10 rounded px-2 py-0.5 text-center text-xs text-white placeholder-white/10 focus:outline-none"
                          />
                          
                          <input 
                            type="number" 
                            placeholder="reps"
                            value={set.reps || ''}
                            onChange={e => handleUpdateSetField(exIdx, setIdx, 'reps', e.target.value)}
                            className="w-16 bg-white/5 border border-white/10 rounded px-2 py-0.5 text-center text-xs text-white placeholder-white/10 focus:outline-none"
                          />

                          <input 
                            type="number" 
                            placeholder="RPE"
                            value={set.rpe || ''}
                            onChange={e => handleUpdateSetField(exIdx, setIdx, 'rpe', e.target.value)}
                            className="w-12 bg-white/5 border border-white/10 rounded px-2 py-0.5 text-center text-xs text-white placeholder-white/10 focus:outline-none"
                          />

                          <button 
                            onClick={() => handleToggleSetComplete(exIdx, setIdx)}
                            className={`w-6 h-6 rounded flex items-center justify-center border transition-all ml-auto ${set.is_completed ? 'bg-accent-green border-accent-green text-white' : 'border-white/10 hover:border-white/30 text-white/20'}`}
                          >
                            <Check className="w-3.5 h-3.5" />
                          </button>

                          <button 
                            onClick={() => handleRemoveSetFromActive(exIdx, setIdx)}
                            className="text-white/10 hover:text-red-400 transition-colors"
                          >
                            <Trash2 className="w-3 h-3" />
                          </button>
                        </div>
                      ))}
                    </div>

                    <button 
                      onClick={() => handleAddSetToActive(exIdx)}
                      className="text-[10px] font-orbitron font-bold text-accent-blue hover:text-accent-blue/80 flex items-center gap-1 mt-1 transition-colors"
                    >
                      <Plus className="w-3 h-3" /> ADD SET
                    </button>
                  </div>
                ))
              )}
            </div>

            <button 
              onClick={handleSaveWorkout}
              disabled={loading}
              className="w-full mt-6 py-2.5 bg-accent-green text-white font-orbitron font-black text-sm tracking-widest rounded-xl hover:bg-accent-green/80 transition-all uppercase shadow-[0_0_20px_rgba(16,185,129,0.2)]"
            >
              {loading ? 'SAVING...' : 'FINISH TRAINING'}
            </button>
          </div>
        ) : (
          <div className="bg-[#120f26]/30 border border-dashed border-white/5 rounded-xl p-8 text-center sticky top-6">
            <Dumbbell className="w-8 h-8 mx-auto text-white/10 mb-4" />
            <h4 className="font-orbitron font-bold text-xs text-white/40 uppercase">No active session</h4>
            <p className="text-[10px] text-white/20 mt-1 leading-normal">
              Select one of your saved routines or start a fresh empty training log to record your work.
            </p>
            <button 
              onClick={handleStartEmptyWorkout}
              className="mt-4 px-4 py-2 bg-accent-blue/15 border border-accent-blue/20 hover:bg-accent-blue/25 text-accent-blue rounded-lg text-[10px] font-orbitron font-bold uppercase tracking-wider transition-all"
            >
              Start empty workout
            </button>
          </div>
        )}
      </div>

      {/* Routine creator Modal */}
      {showCreateTemplate && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-6 bg-black/80 backdrop-blur-sm">
          <div className="w-full max-w-lg bg-[#0a0518] border border-white/10 rounded-2xl p-6 space-y-4">
            <div className="flex justify-between items-center border-b border-white/5 pb-2">
              <h3 className="font-orbitron font-black text-sm text-white uppercase tracking-wider">Create Routine Template</h3>
              <button onClick={() => setShowCreateTemplate(false)} className="text-white/40 hover:text-white"><X className="w-5 h-5" /></button>
            </div>
            
            <input 
              type="text" 
              placeholder="ROUTINE NAME"
              value={templateName}
              onChange={e => setTemplateName(e.target.value)}
              className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-2 text-sm text-white placeholder-white/20 focus:outline-none focus:border-accent-blue/40"
            />
            
            <input 
              type="text" 
              placeholder="DESCRIPTION"
              value={templateDesc}
              onChange={e => setTemplateDesc(e.target.value)}
              className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-2 text-sm text-white placeholder-white/20 focus:outline-none focus:border-accent-blue/40"
            />

            <div className="space-y-2">
              <label className="text-[10px] font-orbitron font-bold text-accent-blue uppercase tracking-widest">Exercises in Routine</label>
              <div className="max-h-[200px] overflow-y-auto space-y-2 border border-white/5 p-2 rounded-xl">
                {selectedTemplateExercises.length === 0 ? (
                  <div className="text-center py-6 text-white/20 text-[10px] font-orbitron uppercase">No exercises added yet.</div>
                ) : (
                  selectedTemplateExercises.map((ex, idx) => (
                    <div key={idx} className="flex justify-between items-center bg-white/5 px-3 py-1.5 rounded-lg">
                      <span className="font-orbitron font-bold text-[10px] text-white/70 uppercase">{ex.name}</span>
                      <button 
                        onClick={() => setSelectedTemplateExercises(prev => prev.filter((_, i) => i !== idx))}
                        className="text-red-400"
                      >
                        <Minus className="w-3.5 h-3.5" />
                      </button>
                    </div>
                  ))
                )}
              </div>
            </div>

            <div className="space-y-1.5">
              <label className="text-[10px] font-orbitron font-bold text-white/40 uppercase tracking-widest">Select Movement to Add</label>
              <select 
                onChange={e => {
                  const val = e.target.value;
                  const item = exercises.find(ex => ex.id === val);
                  if (item && !selectedTemplateExercises.some(ex => ex.id === val)) {
                    setSelectedTemplateExercises(prev => [...prev, item]);
                  }
                }}
                className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-2 text-sm text-white focus:outline-none"
              >
                <option value="">-- Choose Exercise --</option>
                {exercises.map(ex => (
                  <option key={ex.id} value={ex.id} className="bg-[#0a0518]">{ex.name}</option>
                ))}
              </select>
            </div>

            <button 
              onClick={handleCreateTemplate}
              className="w-full py-2 bg-accent-blue hover:bg-accent-blue/80 text-white font-orbitron font-bold text-xs uppercase tracking-widest rounded-xl transition-all"
            >
              SAVE ROUTINE TEMPLATE
            </button>
          </div>
        </div>
      )}

      {/* Custom Exercise creator Modal */}
      {showAddCustomEx && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-6 bg-black/80 backdrop-blur-sm">
          <div className="w-full max-w-md bg-[#0a0518] border border-white/10 rounded-2xl p-6 space-y-4">
            <div className="flex justify-between items-center border-b border-white/5 pb-2">
              <h3 className="font-orbitron font-black text-sm text-white uppercase tracking-wider">Create Custom Movement</h3>
              <button onClick={() => setShowAddCustomEx(false)} className="text-white/40 hover:text-white"><X className="w-5 h-5" /></button>
            </div>
            
            <input 
              type="text" 
              placeholder="MOVEMENT NAME"
              value={customExName}
              onChange={e => setCustomExName(e.target.value)}
              className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-2 text-sm text-white placeholder-white/20 focus:outline-none focus:border-accent-blue/40"
            />
            
            <div className="space-y-1">
              <label className="text-[10px] font-orbitron font-bold text-white/40 uppercase">Target Muscle Group</label>
              <select 
                value={customExMuscle}
                onChange={e => setCustomExMuscle(e.target.value)}
                className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-2 text-sm text-white focus:outline-none"
              >
                {muscles.filter(m => m !== 'ALL').map(m => (
                  <option key={m} value={m} className="bg-[#0a0518]">{m}</option>
                ))}
              </select>
            </div>

            <textarea 
              placeholder="DESCRIPTION / INSTRUCTIONS"
              value={customExDesc}
              onChange={e => setCustomExDesc(e.target.value)}
              className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-2 text-sm text-white placeholder-white/20 focus:outline-none focus:border-accent-blue/40 h-24 resize-none"
            />

            <button 
              onClick={handleCreateCustomExercise}
              className="w-full py-2 bg-accent-purple hover:bg-accent-purple/80 text-white font-orbitron font-bold text-xs uppercase tracking-widest rounded-xl transition-all"
            >
              CREATE MOVEMENT
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
