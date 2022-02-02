import 'package:flutter/material.dart';
import 'package:center_the_widgets/center_the_widgets.dart';

void main() {
  runApp(
    const MaterialApp(
      home: CenterTheWidgets(
        child: Example(),
        color: Colors.blueGrey,
      ),
    ),
  );
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Appbar'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          width: 200000,
          height: 300,
          color: Colors.orange,
          alignment: Alignment.center,
          child: const Text('Some widgets...'),
        ),
      ),
      bottomSheet: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: const Text(
          'This is a bottomSheet.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
