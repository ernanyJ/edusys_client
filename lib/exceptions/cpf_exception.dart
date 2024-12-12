class CpfException implements Exception {
  final String message;

  CpfException(this.message);

  @override
  String toString() {
    return "CpfException: $message";
  }
}