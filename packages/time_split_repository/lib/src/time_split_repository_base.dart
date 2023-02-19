import 'package:time_split_api/time_split_api.dart';

/// {@template todos_repository}
/// A repository that handles `time split` related requests.
/// {@endtemplate}
class TimeSplitRepository {
  /// {@macro todos_repository}
  const TimeSplitRepository({
    required TimeSplitApi timeSplitApi,
  }) : _timeSplitApi = timeSplitApi;

  final TimeSplitApi _timeSplitApi;

  /// Provides a [Stream] of all time splits.
  Stream<List<TimeSplit>> getTimeSplits() => _timeSplitApi.getTimeSplits();

  /// Saves a [timeSplit].
  ///
  /// If a [timeSplit] with the same id already exists, it will be replaced.
  Future<void> saveTodo(TimeSplit timeSplit) =>
      _timeSplitApi.saveTimeSplit(timeSplit);

  /// Deletes the `timeSplit` with the given id.
  ///
  /// If no `timeSplit` with the given id exists, a [timeSplit] error is
  /// thrown.
  Future<void> deleteTimeSplit(String id) => _timeSplitApi.deleteTimeSplit(id);
}
