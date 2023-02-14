class ShoppingCart {
  final Map<String, int> items = {};

  /// Update the value if a given key already exists
  /// Set the value if it doesn't
  void add(String key, int quantity) {
    items.update(
      key,
      (value) => quantity + value,
      ifAbsent: () => quantity,
    );
  }
}
