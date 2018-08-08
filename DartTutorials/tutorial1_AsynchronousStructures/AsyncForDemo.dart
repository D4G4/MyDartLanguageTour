import 'dart:async';
import 'dart:io';
import 'dart:math';

// main() async{
//   await for (var tick in endlessCountDown()){
//     print("countDown $tick");
//   }

//   await for (var line in endlessCountUp()) {
//     print("countUp $line");
//   }
// }

main() {

  //Either
  listenCountdownDown();
  listenCountdownUp();

  //Or simply use 
  endlessCountUp().listen((tickUp) => print(tickUp));
  endlessCountDown().listen((tickDown) => print(tickDown));
}

listenCountdownDown() async {
  await for (var tick in endlessCountDown()) {
    print("countDown $tick");
  }
}

listenCountdownUp() async {
  await for (var line in endlessCountUp()) {
    print("countUp $line");
  }
}

Stream<int> endlessCountUp() async* {
  var i = 0;
  while (true) {
    sleep(Duration(seconds: 1));
    yield i++;
  }
}

Stream<int> endlessCountDown() async* {
  var i = pow(2, 30) - 1;
  while (true) {
    sleep(Duration(seconds: 1));
    if (i == 0) break;
    yield i--;
  }
}
