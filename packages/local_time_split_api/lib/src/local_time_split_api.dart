import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_split_api/time_split_api.dart';

/// {@template local_time_split_api}
/// A Flutter implementation of the [TimeSplitApi] that uses local storage.
/// {@endtemplate}
class LocalTimeSplitApi extends TimeSplitApi {
  /// {@macro local_time_split_api}
  LocalTimeSplitApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _timeSplitStreamController =
      BehaviorSubject<List<TimeSplit>>.seeded(const []);

  @visibleForTesting
  static const kTimeSplitCollectionKey = '__todos_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final timeSplitJson = _getValue(kTimeSplitCollectionKey);
    if (timeSplitJson != null) {
      final timeSplits = List<Map<dynamic, dynamic>>.from(
        json.decode(timeSplitJson) as List,
      )
          .map((jsonMap) =>
              TimeSplit.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      // Cast of List<dynamic> to List<TimeSplit>
      try {
        _timeSplitStreamController.add(timeSplits as List<TimeSplit>);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    } else {
      _timeSplitStreamController.add(const []);
    }
  }

  @override
  Stream<List<TimeSplit>> getTimeSplits() =>
      _timeSplitStreamController.asBroadcastStream();

  @override
  Future<void> saveTimeSplit(TimeSplit timeSplit) {
    final timeSplits = [..._timeSplitStreamController.value];
    final splitIndex = timeSplits.indexWhere((t) => t.id == timeSplit.id);
    if (splitIndex >= 0) {
      timeSplits[splitIndex] = timeSplit;
    } else {
      timeSplits.add(timeSplit);
    }

    _timeSplitStreamController.add(timeSplits);
    return _setValue(kTimeSplitCollectionKey, json.encode(timeSplits));
  }

  @override
  Future<void> deleteTimeSplit(String id) {
    // TODO: implement deleteTimeSplit
    throw UnimplementedError();
  }
}
