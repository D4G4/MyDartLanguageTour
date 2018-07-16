import 'dart:async';

main() {
  printDailyNewsDigest();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
  /*for(int i=0; i < 1000; i++) {
    print(i);
  }*/
}

printDailyNewsDigest() async {
  String news = await gatherNewsReports();
  print(news);
}

const news = '<gathered news goes here>';
const oneSecond = Duration(seconds: 1);

final newsStream =
    Stream.periodic(oneSecond, (_a) => news + _a.runtimeType.toString());

final newsStream2 = Stream.periodic(oneSecond, (_) => "Dennis");

//Imagine that this function is more complex and slow
Future gatherNewsReports() =>
    newsStream2.first.then((_) => news + _); //.first returns a future

/*Future gatherNewsReportFromServer() => HttpRequest.(
      'https://www.dartlang.org/f/dailyNewsDigest.txt',
    );*/

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}
