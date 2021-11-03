
import 'package:bloc_counter_app/events/bloc/time_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/time_bloc.dart';
import 'bloc/time_state.dart';
class Home_Screen extends StatefulWidget{
  @override
  _HomeScreenState createState() =>_HomeScreenState();

}
class _HomeScreenState extends State<Home_Screen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider<TimeBloc>(
        create: (context) => TimeBloc(),
        child: BlocBuilder<TimeBloc, TimeState>(
          builder: (context, state){
            final String minuteStart=((state.timeDuration/60)%60).floor().toString().padLeft(2, "0");
            final String secondStr=(state.timeDuration%60).floor().toString().padLeft(2,"0");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("$minuteStart : $secondStr", style:  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: button(context, state),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
   
  }
  button(context, state)
  {
    final TimeBloc timeBloc=BlocProvider.of<TimeBloc>(context);
    if(state is InitialState)
    {
      return[
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed:()=>timeBloc.add(StartEvent(state.timeDuration))),

      ];
    }
    else if(state is RunningState){
      return[
        FloatingActionButton(
            child: Icon(Icons.pause),
            onPressed:()=>timeBloc.add(PausedEvent())),
        const SizedBox(
          width: 100,
        ),
        FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed:()=>timeBloc.add(ResetEvent())),
      ];
    }else if(state is PausedEvent)
      {
        return [
          FloatingActionButton(
              child: Icon(Icons.play_arrow),
              onPressed:()=>timeBloc.add(ResumeEvent())),
          FloatingActionButton(
              child: Icon(Icons.replay),
              onPressed:()=>timeBloc.add(ResetEvent())),
        ];
      }else if(state is CompleteState){
      return[
        FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed:()=>timeBloc.add(ResetEvent()),
        ),
      ];
    }else{
      return [];
    }
  }

}