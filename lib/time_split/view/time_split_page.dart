import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../time_split.dart';

class TimeSplitPage extends StatelessWidget {
  const TimeSplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimeSplitBloc(),
      child: const TimeSplitView(),
    );
  }
}

class TimeSplitView extends StatelessWidget {
  const TimeSplitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeSplitBloc, TimeSplitState>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
