import 'package:flutter/material.dart';
import 'package:local_time_split_api/local_time_split_api.dart';

import 'bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final timeSplitApi = LocalTimeSplitApi(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(timeSplitApi: timeSplitApi);
}
