import std.datetime;

import std.traits;
import std.stdio;
import std.exception;

bool isPowerOfTwo( int n) {
  return (n & (n-1))==0;
};

struct NanoTimer {
  immutable long MASK;
  const StopWatch sw;
  long counter;
  TickDuration last;
  immutable long SCALE_FACTOR;
  int n;

  @disable this();
    
  this(int n) {
    enforce(isPowerOfTwo(n), "N needs to be power of two");
    this.n = n;
    last = sw.peek();
    MASK = n-1;
    SCALE_FACTOR = n * TickDuration.ticksPerSec;
    sw = StopWatch(AutoStart.yes);
  };
  
  void ping() {
    counter++;
    if ( (counter & MASK) == 0) {
      immutable next = sw.peek();
      immutable d = next - last;
      writefln("%s .. nsecs=%s MM/sec=%s", counter, d.nsecs() / n, SCALE_FACTOR / d.length );
      last = next;
    }
  }
}
