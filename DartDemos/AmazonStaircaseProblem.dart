main() {
  print('Hello world');
  //var onlyStepsToBeTaken = [1, 3, 5];
  print(numOfWays(8, [1, 3, 5]));
}
int numOfWays(int noOfTotalSteps, [var onlyPossibleSteps]) {
  if (onlyPossibleSteps.length == 0) {
    int counter = 1;
    while (noOfTotalSteps != 1) {
      counter++;
      noOfTotalSteps = (noOfTotalSteps / 2).round();
      print("n = $noOfTotalSteps");
    }
    return counter;
  } else {
    int counter = 0;
    for (int i = 0; i < onlyPossibleSteps.length; i++) {
      int n = noOfTotalSteps;
      if (onlyPossibleSteps[i] <= noOfTotalSteps)
        while (n != 1) {
          n = (n / onlyPossibleSteps[i]).round();
          print("n = $n");
          counter++;
          if (n % onlyPossibleSteps[i] == 0) break;
        }
    }
    return counter;
  }
}
