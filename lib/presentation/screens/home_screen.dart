import 'package:counter_app/logic/counter_bloc/counter_bloc.dart';
import 'package:counter_app/logic/counter_bloc/counter_events.dart';
import 'package:counter_app/logic/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc,CounterState>(
      listener: (context, state) {
        if (state.counterValue == 10) {
          showSnackBar(context, message: "current value is 10");
        }
        if (state.isIncremented) {
          showSnackBar(context, message: state.toString());
        } else {
          showSnackBar(context, message: state.toString());
        }
      },
      child: Scaffold(
        backgroundColor: widget.color,
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${context.watch<CounterBloc>().state.counterValue}",
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(IncrementRequest());
                  },
                  child: Icon(Icons.add, color: Colors.white),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    var currentValue = BlocProvider.of<CounterBloc>(context).state.counterValue;
                    if (currentValue == 0) {
                      showSnackBar(
                        context,
                        message: "current Value is 0, you cannot decrement",
                      );
                    } else {
                      BlocProvider.of<CounterBloc>(context).add(DecrementRequest());
                    }
                  },
                  child: Icon(Icons.remove, color: Colors.white),
                ),
                const SizedBox(width: 30),
              ],
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(ResetRequest());
                },
                child: Text(
                  "reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 3), content: Text(message)),
    );
  }
}
