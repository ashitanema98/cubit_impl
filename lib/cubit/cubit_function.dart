import 'package:cubit_impl/cubit/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  incrementCounter() {
    emit(CounterState(counter: state.counter + 1));
  }

  decrementCounter() {
    emit(CounterState(counter: state.counter - 1));
  }
}
