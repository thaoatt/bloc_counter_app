import 'package:bloc_counter_app/events/CounterEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc(int initialState) : super(initialState);

  @override
  int get initialState=>0;
  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    print(state);
    switch(event){
      case CounterEvent.increment:
        break;
      case CounterEvent.decrement:
        break;
    }

  }
}