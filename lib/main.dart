import 'package:bloc_counter_app/events/bloc/CounterBloc.dart';
import 'package:bloc_counter_app/events/counter_page.dart';
import 'package:bloc_counter_app/events/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
//
// class MyApp extends StatelessWidget {
//   Stream<int> aStreamFunction() async* {
//     // async* = asynchronous, hàm này có thể gọi 1 lần nhg trả về nhiều giá trị (yield)
//     yield 2;
//     yield 3;
//     yield 4;
//     yield 5;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CounterPage(),
//       // home: Center(
//       //   child: BlocProvider<CounterBloc>(
//       //     create: (context) => CounterPage(),
//       //     child: CounterPage(),
//       //   ),
//       // ),
//     );
//   }
// }
 class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Screen(),
    );
  }
 }