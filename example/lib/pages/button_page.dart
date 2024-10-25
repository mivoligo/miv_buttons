import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import '../widgets/properties/properties.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button')),
      body: const _Button(),
      backgroundColor: Colors.grey.shade200,
    );
  }
}

class _Button extends StatefulWidget {
  const _Button();

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  Color color = Colors.lightGreen;
  double borderRadius = 8;
  double horizontalPadding = 12;
  double verticalPadding = 8;
  double elevation = 6;
  double pressedElevation = 2;
  Shape shape = Shape.rectangle;
  Widget child = const Column(
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
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Button(
              onClick: () {},
              color: color,
              borderRadius: borderRadius,
              horizontalPadding: horizontalPadding,
              verticalPadding: verticalPadding,
              elevation: elevation,
              pressedElevation: pressedElevation,
              shape: shape,
              semanticLabel: 'An example button with a child',
              child: child,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  PropertyChild(
                    onValueChange: (value) => setState(() {
                      child = value;
                    }),
                  ),
                  const Divider(height: 16),
                  PropertyColorChange(
                    propertyName: 'color',
                    colors: backgroundColors,
                    onColorChange: (value) => setState(() {
                      color = value;
                    }),
                  ),
                  const Divider(height: 16),
                  if (shape != Shape.circle) ...[
                    PropertyValueChange(
                      key: const Key('borderRadius'),
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
                      key: const Key('horizontalPadding'),
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
                      key: const Key('verticalPadding'),
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
                  ],
                  PropertyValueChange(
                    key: const Key('elevation'),
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
                    key: const Key('pressedElevation'),
                    propertyName: 'pressedElevation',
                    initialValue: pressedElevation,
                    maxValue: 24,
                    onValueChanged: (value) {
                      setState(() {
                        pressedElevation = value;
                      });
                    },
                  ),
                  const Divider(height: 16),
                  PropertyShape(
                    shape: shape,
                    onShapeChange: (value) {
                      setState(() {
                        shape = value;
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
