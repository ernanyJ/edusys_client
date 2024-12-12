class Validator {
  // Implement CPF validation
  static bool isValidCPF(String value) {
    // Remove any non-numeric characters
    value = value.replaceAll(RegExp(r'\D'), '');

    // CPF must be 11 digits long
    if (value.length != 11) return false;

    // Check for known invalid CPFs
    if (RegExp(r'^(\d)\1*$').hasMatch(value)) return false;

    // Validate first digit
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(value[i]) * (10 - i);
    }
    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;
    if (firstDigit != int.parse(value[9])) return false;

    // Validate second digit
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(value[i]) * (11 - i);
    }
    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;
    if (secondDigit != int.parse(value[10])) return false;

    return true;
  }
}
