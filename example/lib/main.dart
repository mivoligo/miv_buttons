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
        title: const Text('Demo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Click a button to play with it\'s main properties',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 48),
              Column(
                children: [
                  Button.label(
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ButtonLabelPage();
                          },
                        ),
                      );
                    },
                    label: 'PRESS ME!',
                    backgroundColor: Colors.redAccent,
                  ),
                  const SizedBox(height: 8),
                  const Text('Button.label()'),
                ],
              ),
              const Divider(height: 24),
              Column(
                children: [
                  Button.icon(
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ButtonIconPage();
                          },
                        ),
                      );
                    },
                    icon: Icons.fingerprint,
                    backgroundColor: Colors.green,
                  ),
                  const SizedBox(height: 8),
                  const Text('Button.icon()'),
                ],
              ),
              const Divider(height: 24),
              Column(
                children: [
                  Button.iconLabel(
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ButtonIconLabelPage();
                          },
                        ),
                      );
                    },
                    icon: Icons.fingerprint,
                    label: 'PRESS ME',
                    backgroundColor: Colors.amber,
                  ),
                  const SizedBox(height: 8),
                  const Text('Button.iconLabel()'),
                ],
              ),
              const Divider(height: 24),
              Column(
                children: [
                  Button.labelIcon(
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ButtonLabelIconPage();
                          },
                        ),
                      );
                    },
                    icon: Icons.fingerprint,
                    label: 'PRESS ME',
                    foregroundColor: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  const Text('Button.labelIcon()'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
