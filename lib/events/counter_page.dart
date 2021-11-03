import 'package:bloc_counter_app/events/bloc/CounterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, counter){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        print("Now debug here");
                      },
                      child:  const Text(
                        "Increment",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    decoration: const BoxDecoration(color: Colors.amberAccent),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Center(
                      child: Text("This is Counter App"),
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        print("Now debug here");
                      },
                      child:const Text(
                        "Increment",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    decoration:const BoxDecoration(color: Colors.purple),
                  ),
                ],
              );
            },
          ),
      ),
    );
  }
}
