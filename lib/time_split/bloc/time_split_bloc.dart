import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'time_split_event.dart';
part 'time_split_state.dart';

class TimeSplitBloc extends Bloc<TimeSplitEvent, TimeSplitState> {
  TimeSplitBloc() : super(const TimeSplitState()) {
    on<TimeSplitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
