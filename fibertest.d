
private import core.sys.posix.sys.mman;

import core.thread;
import std.stdio;
import std.datetime;

import nanoTimer;

final class MyFiber : Fiber {
  Fiber     other;
  NanoTimer sw;

  this(Fiber utha) {
    this.other = utha;
    sw = NanoTimer( 1 << 25);
    super(&run);
  };

 private:
  void run() {
    writefln("Running %s %s", &this, state);
    while ( true  ) {
      sw.ping();
      other.call();
    };
  };
};

final class Ponger : Fiber {
  this() {
    super(&doit);
  };

  void doit() {
    while(true) {
      Fiber.yield();
    }
  };
};

void main() {
  auto pong = new Ponger();
  auto fib1 = new MyFiber(pong);
  writeln("Calling fib1");
  fib1.call();
  writeln("Fib1 called");
  //Thread.sleep( dur!"seconds"(20));
}
