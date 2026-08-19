import 'package:flutter/material.dart';

import 'features/analyze/ui/analyze_button.dart';
import 'features/settings/state/settings_state.dart';
import 'features/settings/ui/settings_widget.dart';
import 'features/log/ui/logs_view_widget.dart';
import 'features/log/uistate/logger.dart';

void main() {
  registerLogger();
  registerSettingsState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sort Media',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(
          seedColor: Colors.greenAccent,
        ),
      ),
      home: const MyHomePage(title: 'Sort Media'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    log("counter: $_counter (before)");
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context)
        .size
        .height;
    final ColorScheme colorScheme = Theme.of(context)
        .colorScheme;
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("${widget.title} ($_counter)"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: .all(15),
              child: Column(
                children: [
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  SettingsWidget(),
                  AnalyzeButton(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight / 4,
            child: Container(
              color: colorScheme.secondaryContainer,
              child: LogsViewWidget(),
            ),
          ),
        ],
      ),
      // ),
      //bottomSheet: LogsViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
