class InvalidInput implements Exception {
  final String message;

  InvalidInput(this.message);

  @override
  String toString() {
    return "Invalid input: $message";
  }
}