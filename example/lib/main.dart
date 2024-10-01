import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import 'widgets/properties/properties.dart';

const vGap16 = SizedBox(height: 16);

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
  double paddingHorizontal = 12;
  double paddingVertical = 8;
  double elevation = 6;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Button.label(
            onClick: () {},
            label: label,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            borderRadius: borderRadius,
            paddingHorizontal: paddingHorizontal,
            paddingVertical: paddingVertical,
            elevation: elevation,
          ),
          const SizedBox(height: 48),
          PropertyLabel(
            onTextChange: (value) => setState(() {
              label = value;
            }),
            initialValue: label,
          ),
          vGap16,
          PropertyBackgroundColor(
            onColorChange: (color) => setState(() {
              backgroundColor = color;
            }),
          ),
          vGap16,
          PropertyForegroundColor(
            onColorChange: (color) => setState(() {
              foregroundColor = color;
            }),
          ),
          vGap16,
          PropertyBorderRadius(
            onRadiusChange: (value) {
              setState(() {
                borderRadius = value;
              });
            },
            borderRadius: borderRadius,
          ),
          vGap16,
          PropertyPadding(
            propertyName: 'paddingHorizontal',
            initialValue: paddingHorizontal,
            onValueChanged: (value) {
              setState(() {
                paddingHorizontal = value;
              });
            },
          ),
          vGap16,
          PropertyPadding(
            propertyName: 'paddingVertical',
            initialValue: paddingVertical,
            onValueChanged: (value) {
              setState(() {
                paddingVertical = value;
              });
            },
          ),
          vGap16,
          PropertyElevation(
            initialElevation: elevation,
            onElevationChanged: (value) {
              setState(() {
                elevation = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
