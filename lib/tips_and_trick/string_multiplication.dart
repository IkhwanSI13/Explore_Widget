class StringMultiplication {

  /// Example:
  /// call function:
    /// printStar(4);
  /// result:
    /// *
    /// **
    /// ***
    /// ****
  void printStar(int number) {
    for (int i = 1; i <= number; i++) {
      print("*" * i);
    }
  }
}
