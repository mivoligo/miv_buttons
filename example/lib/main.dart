import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import 'pages/pages.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('click selected button to find out more about its properties'),
            Column(
              children: [
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
                  backgroundColor: Colors.redAccent,
                ),
                SizedBox(height: 8),
                Text('Button.label()'),
              ],
            ),
            Divider(height: 24),
            Column(
              children: [
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
                  backgroundColor: Colors.green,
                ),
                SizedBox(height: 8),
                Text('Button.icon()'),
              ],
            ),
            Divider(height: 24),
            Column(children: [
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
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.fingerprint), Text('PRESS ME!')],
                ),
              ),
              SizedBox(height: 8),
              Text('Button.widget()'),
            ]),
            Divider(height: 24),
            Column(
              children: [
                Button.iconLabel(
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ButtonIconLabelPage();
                        },
                      ),
                    );
                  },
                  icon: Icons.fingerprint,
                  label: 'PRESS ME',
                ),
                SizedBox(height: 8),
                Text('Button.iconLabel'),
              ],
            ),
            Divider(height: 24),
            Column(
              children: [
                Button.labelIcon(
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ButtonLabelIconPage();
                        },
                      ),
                    );
                  },
                  icon: Icons.fingerprint,
                  label: 'PRESS ME',
                ),
                SizedBox(height: 8),
                Text('Button.labelIcon'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
