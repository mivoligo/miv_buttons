import 'package:example/pages/button_icon_page.dart';
import 'package:example/pages/button_label_page.dart';
import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import 'widgets/properties/properties.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo page'),
      ),
      body: Column(
        children: [
          Text('click selected button to find out more about its properties'),
          Row(
            children: [
              Text('Button.label()'),
              Button.label(
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ButtonLabelPage();
                      },
                    ),
                  );
                },
                label: 'PRESS ME!',
              ),
            ],
          ),
          Row(
            children: [
              Text('Button.icon()'),
              Button.icon(
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ButtonIconPage();
                      },
                    ),
                  );
                },
                icon: Icons.fingerprint,
              ),
            ],
          ),
          Row(
            children: [
              Text('Button.widget()'),
              Button.widget(
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ButtonLabelPage();
                      },
                    ),
                  );
                },
                child: Row(
                  children: [Icon(Icons.fingerprint), Text('PRESS ME!')],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
