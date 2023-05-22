import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/text_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => TextBloc(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("text yozing...")),
            ),
          ),
          MaterialButton(
            onPressed: () {
              BlocProvider.of<TextBloc>(context)
                  .add(TextChangeEvent(txtController.value.text));
            },
            child: Text("Show"),
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<TextBloc, TextState>(
            builder: (context, state) {
              if (state is TextChange) {
                return Text(
                  state.text,
                  style: TextStyle(fontSize: 30),
                );
              } else {
                return Text("pustoy");
              }
            },
          )
        ],
      ),
    );
  }
}
