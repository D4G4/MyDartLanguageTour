import 'dart:async';

main(List<String> args) async {
  MyEventLoop.callFunc(_fakeMain, []);
}

void _fakeMain(List<String> args) {
  int x = 10;

  _func() {
    print("value of x = $x");
    x--;
    if (x != 0) {
      //Future(_func);
      scheduleMicrotask(_func());
    }
  }

  _func();
}

class MyEventLoop {
  static final List<Function> queueList = [];
  static final List<Function> microTaskList = [];

  static void runQueueFunction(Function fun) {
    print("Queuing function \n");
    queueList.add(fun);
  }

  static void runMicroTaskFunction(Function fun) {
    print("Adding microtask \n");
    microTaskList.add(fun);
  }

  static void startOrResumeMyEventLoop() {
    while (microTaskList.isNotEmpty) {
      print("Length = ${microTaskList.length}");
      microTaskList
          .removeAt(0)(); //Popping out first task and executing it right away
      print("Length = ${microTaskList.length}\n");
    }

    /*while (queueList.isNotEmpty) {
      while (microTaskList.isNotEmpty) {
        microTaskList
            .removeAt(0)(); //Popping out first task and executing it right away
      }
      queueList.removeAt(0)();
    }*/
    if (microTaskList.isNotEmpty || queueList.isNotEmpty) {
      startOrResumeMyEventLoop();
    }
  }

  ///A [Zone] is like a context which we can fork out on top of our main thread.
  ///So, in [Microtasks.dart] those functions implicitly used their own zone and [Future] also execute in their own [Zone]
  ///
  /// So it's like partitioning off portions of execution for our application.
  ///
  /// In the method below, we are basically grabbing the current zone by [Zone.current]
  /// which is the main zone where most of the calls are being exeuted and
  /// we want to fork on that current zone and create a new one with a certain [ZoneSpecification].
  static void callFunc(Function func, List<String> args) {
    var zone = Zone.current.fork(
      specification: ZoneSpecification(
        scheduleMicrotask: (zoneOne, delegate, zoneTwo, func) {
          print("Scheduling a mircotask");
          MyEventLoop.runMicroTaskFunction(func);
        },
        createTimer: (zoneOne, delegate, zoneTwo, duration, funcToDelay) {
          if (duration == Duration.zero) {
            print("Running queue function, duration = $duration");
            MyEventLoop.runQueueFunction(funcToDelay);
            return null;
          } else {
            print("Returning a timer");
            ///Mimics the behaviour of [Future.delayed] object except it's not asynchronous
            return Timer(duration, funcToDelay);
          }
        },
      ),
    );

    zone.runUnary(func, args);
    startOrResumeMyEventLoop();
  }
}
