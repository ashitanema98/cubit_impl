import 'package:cubit_impl/cubit/cubit_function.dart';
import 'package:cubit_impl/cubit/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '** Counter Value **',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, counterState) {
                return Text(
                  '${counterState.counter}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
            Flexible(
                child: Container(
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).incrementCounter();
                    },
                    child: Icon(Icons.exposure_plus_1),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrementCounter();
                    },
                    child: Icon(Icons.exposure_minus_1),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
