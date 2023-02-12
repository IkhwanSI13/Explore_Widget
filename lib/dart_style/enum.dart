enum Level {
  beginner(1),
  medium(2),
  hard(3);

  const Level(this.levelNumber);

  final int levelNumber;

  String getDescription() {
    switch (levelNumber) {
      case 1:
        return "Rookie";
      case 2:
        return "Star";
      case 3:
        return "All star";
      default:
        return "Unknown";
    }
  }
}

// Use
doSomething(){
  const beginner= Level.beginner;
  print('============ Enum Example ============');
  print('levelNumber: ${beginner.levelNumber}');
  print('getDescription: ${beginner.getDescription()}');
}
