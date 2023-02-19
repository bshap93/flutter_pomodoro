import 'package:time_split_api/time_split_api.dart';

/// {@template todos_api}
/// The interface for an API that provides access to a list of time splits.
/// {@endtemplate}
abstract class TimeSplitApi {
  /// {@macro todos_api}
  const TimeSplitApi();

  Stream<List<TimeSplit>> getTimeSplits();

  Future<void> saveTimeSplit(TimeSplit timeSplit);

  Future<void> deleteTimeSplit(String id);
}
