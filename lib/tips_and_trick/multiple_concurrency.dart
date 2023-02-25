class MultipleConcurrency {
  Future<String> functionOne() async {
    return "first";
  }

  Future<int> functionTwo() async {
    return 2;
  }

  main() async {
    /// The result will be of type List<String>, if the function returns only
    /// Strings. But if the function has a different return value,
    /// the result will be of type List<Object>
    ///
    /// If any of the input futures fails, Future.wait() will throw an
    /// exception one all future have completed
    final result = await Future.wait([
      functionOne(),
      functionTwo(),
    ]);
  }
}
