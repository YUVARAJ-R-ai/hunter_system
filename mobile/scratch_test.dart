void main() {
  try {
    final int Function() f = () => null as dynamic;
    f();
  } catch (e) {
    print("EXCEPTION CAUGHT: $e");
  }
}
