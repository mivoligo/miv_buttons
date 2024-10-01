import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

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
  double borderRadius = 8;

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
          ),
          const SizedBox(height: 24),
          PropertyLabel(
            onTextChange: (value) => setState(() {
              label = value;
            }),
            initialValue: label,
          ),
          const SizedBox(height: 8),
          PropertyBackgroundColor(
            onColorChange: (color) => setState(() {
              backgroundColor = color;
            }),
          ),
          const SizedBox(height: 8),
          PropertyForegroundColor(
            onColorChange: (color) => setState(() {
              foregroundColor = color;
            }),
          ),
          const SizedBox(height: 8),
          PropertyBorderRadius(
            onRadiusChange: (value) {
              setState(() {
                borderRadius = value;
              });
            },
            borderRadius: borderRadius,
          ),
        ],
      ),
    );
  }
}

class PropertyRow extends StatelessWidget {
  const PropertyRow({
    super.key,
    required this.propertyName,
    required this.propertyWidget,
  });

  final String propertyName;
  final Widget propertyWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          propertyName,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        const SizedBox(width: 16),
        Expanded(child: propertyWidget),
      ],
    );
  }
}

class PropertyLabel extends StatelessWidget {
  const PropertyLabel({
    super.key,
    required this.onTextChange,
    required this.initialValue,
  });

  final String initialValue;
  final ValueChanged<String> onTextChange;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'label',
      propertyWidget: TextFormField(
        decoration: const InputDecoration(filled: true),
        initialValue: initialValue,
        onChanged: (value) => onTextChange(value),
      ),
    );
  }
}

class PropertyBackgroundColor extends StatelessWidget {
  const PropertyBackgroundColor({super.key, required this.onColorChange});

  final ValueChanged<Color> onColorChange;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'backgroundColor',
      propertyWidget: Wrap(
        children: Colors.primaries
            .map(
              (color) => InkWell(
                onTap: () => onColorChange(color),
                child: Container(
                  width: 48,
                  height: 48,
                  color: color,
                ),
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class PropertyForegroundColor extends StatelessWidget {
  const PropertyForegroundColor({super.key, required this.onColorChange});

  final ValueChanged<Color> onColorChange;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'foregroundColor',
      propertyWidget: Wrap(
        children: [
          Colors.white,
          Colors.black,
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Colors.blue,
          Colors.purple,
        ]
            .map(
              (color) => InkWell(
                onTap: () => onColorChange(color),
                child: Container(
                  width: 48,
                  height: 48,
                  color: color,
                ),
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class PropertyBorderRadius extends StatefulWidget {
  const PropertyBorderRadius({
    super.key,
    required this.onRadiusChange,
    required this.borderRadius,
  });

  final ValueChanged onRadiusChange;
  final double borderRadius;

  @override
  State<PropertyBorderRadius> createState() => _PropertyBorderRadiusState();
}

class _PropertyBorderRadiusState extends State<PropertyBorderRadius> {
  late double borderRadius;

  @override
  void initState() {
    super.initState();
    borderRadius = widget.borderRadius;
  }

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'borderRadius',
      propertyWidget: Row(
        children: [
          Button.icon(
            onClick: () {
              if (borderRadius > 0) {
                setState(() {
                  borderRadius--;
                  widget.onRadiusChange(borderRadius);
                });
              }
            },
            icon: Icons.remove,
          ),
          Text(borderRadius.toString()),
          Button.icon(
            onClick: () {
              if (borderRadius < 100) {
                setState(() {
                  borderRadius++;
                  widget.onRadiusChange(borderRadius);
                });
              }
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
