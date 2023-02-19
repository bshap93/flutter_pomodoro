// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart' show immutable;
import 'package:uuid/uuid.dart';

@immutable
class TimeSplit extends Equatable {
  final String id;
  final Duration workTime;
  final Duration shortRestTime;
  final Duration longRestTime;
  final int workBlocksPerLongRest;

  TimeSplit(
      {String? id,
      required this.workTime,
      required this.shortRestTime,
      required this.longRestTime,
      required this.workBlocksPerLongRest})
      : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  /// Returns a copy of this `todo` with the given values updated.
  ///
  /// {@macro todo_item}
  TimeSplit copyWith({
    Duration? workTime,
    Duration? shortRestTime,
    Duration? longRestTime,
    int? workBlocksPerLongRest,
  }) {
    return TimeSplit(
      workTime: workTime ?? this.workTime,
      shortRestTime: shortRestTime ?? this.shortRestTime,
      longRestTime: longRestTime ?? this.longRestTime,
      workBlocksPerLongRest:
          workBlocksPerLongRest ?? this.workBlocksPerLongRest,
    );
  }

  @override
  List<Object?> get props =>
      [workTime, shortRestTime, longRestTime, workBlocksPerLongRest];

  static fromJson(Map<String, dynamic> map) {}
}
