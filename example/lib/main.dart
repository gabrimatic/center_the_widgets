import 'package:flutter/material.dart';

import 'package:center_the_widgets/center_the_widgets.dart';

void main() {
  runApp(
    const MaterialApp(
      home: CenterTheWidgets(
        color: Colors.blueGrey,
        child: Example(),
      ),
    ),
  );
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CenterTheWidgets example'),
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
          'Bottom sheets stay inside the centered surface too.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
