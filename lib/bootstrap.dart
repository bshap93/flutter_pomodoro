import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer/app/app.dart';
import 'package:time_split_api/time_split_api.dart';
import 'package:time_split_repository/time_split_repository.dart';

import 'app/app_bloc_observer.dart';

void bootstrap({required TimeSplitApi timeSplitApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final timeSplitRepository = TimeSplitRepository(timeSplitApi: timeSplitApi);

  runZonedGuarded(() => runApp(App(timeSplitRepository: timeSplitRepository)),
      (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
