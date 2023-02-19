class Ticker {
  const Ticker();

  /// The tick function takes the number of ticks (seconds) needed and returns
  /// a stream.
  Stream<int> tick({required int ticks}) {
    /// . Returns a stream that emits the same events that this stream would if
    /// listened to at the same time, until either this stream ends or it has
    /// emitted [count] data events, at which point the returned stream is done.

    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
