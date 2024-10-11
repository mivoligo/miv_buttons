import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'miv_buttons demo',
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button.labelIcon(
              onClick: () async {
                if (!await launchUrl(
                  Uri.parse('https://github.com/mivoligo/miv_buttons'),
                )) {
                  throw Exception('Could not open the page');
                }
              },
              icon: Icons.open_in_new,
              label: 'Project Website',
              foregroundColor: Colors.white,
              elevation: 2,
              pressedElevation: 0,
            ),
          ),
        ],
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
                    color: Colors.redAccent,
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
                    color: Colors.green,
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
                    color: Colors.amber,
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
              const Divider(height: 24),
              Column(
                children: [
                  Button(
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ButtonPage();
                          },
                        ),
                      );
                    },
                    color: Colors.lightGreen,
                    child: const Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.sunny),
                            Icon(Icons.access_alarms),
                          ],
                        ),
                        Text('PRESS ME!'),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Button()'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
