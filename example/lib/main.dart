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
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Demo page'),
      ),
      body: const _ButtonWithLabel(),
    );
  }
}

class _ButtonWithLabel extends StatefulWidget {
  const _ButtonWithLabel();

  @override
  State<_ButtonWithLabel> createState() => _ButtonWithLabelState();
}

class _ButtonWithLabelState extends State<_ButtonWithLabel> {
  String label = 'press me';
  Color backgroundColor = Colors.blue;
  Color foregroundColor = Colors.white;
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);
  double borderRadius = 6;
  double horizontalPadding = 12;
  double verticalPadding = 8;
  double elevation = 6;
  double pressedElevation = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Button.label(
              onClick: () {},
              label: label,
              backgroundColor: backgroundColor,
              labelColor: foregroundColor,
              borderRadius: borderRadius,
              horizontalPadding: horizontalPadding,
              verticalPadding: verticalPadding,
              elevation: elevation,
              pressedElevation: pressedElevation,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  PropertyLabel(
                    onTextChange: (value) => setState(() {
                      label = value;
                    }),
                    initialValue: label,
                  ),
                  const Divider(height: 16),
                  PropertyColorChange(
                    propertyName: 'backgroundColor',
                    colors: backgroundColors,
                    onColorChange: (color) => setState(() {
                      backgroundColor = color;
                    }),
                  ),
                  const Divider(height: 16),
                  PropertyColorChange(
                    propertyName: 'labelColor',
                    colors: labelColors,
                    onColorChange: (color) => setState(() {
                      foregroundColor = color;
                    }),
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    propertyName: 'borderRadius',
                    initialValue: borderRadius,
                    onValueChanged: (value) {
                      setState(() {
                        borderRadius = value;
                      });
                    },
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    propertyName: 'horizontalPadding',
                    initialValue: horizontalPadding,
                    maxValue: 64,
                    onValueChanged: (value) {
                      setState(() {
                        horizontalPadding = value;
                      });
                    },
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    propertyName: 'verticalPadding',
                    initialValue: verticalPadding,
                    maxValue: 64,
                    onValueChanged: (value) {
                      setState(() {
                        verticalPadding = value;
                      });
                    },
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    propertyName: 'elevation',
                    initialValue: elevation,
                    maxValue: 24,
                    onValueChanged: (value) {
                      setState(() {
                        elevation = value;
                      });
                    },
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    propertyName: 'pressedElevation',
                    initialValue: pressedElevation,
                    maxValue: 24,
                    onValueChanged: (value) {
                      setState(() {
                        pressedElevation = value;
                      });
                    },
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
