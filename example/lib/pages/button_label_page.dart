import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import '../widgets/properties/properties.dart';

class ButtonLabelPage extends StatelessWidget {
  const ButtonLabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button.label')),
      body: const _ButtonWithLabel(),
      backgroundColor: Colors.grey.shade200,
    );
  }
}

class _ButtonWithLabel extends StatefulWidget {
  const _ButtonWithLabel();

  @override
  State<_ButtonWithLabel> createState() => _ButtonWithLabelState();
}

class _ButtonWithLabelState extends State<_ButtonWithLabel> {
  String label = 'PRESS ME!';
  Color color = Colors.redAccent;
  Color labelColor = Colors.white;
  double borderRadius = 8;
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
              color: color,
              labelColor: labelColor,
              borderRadius: borderRadius,
              horizontalPadding: horizontalPadding,
              verticalPadding: verticalPadding,
              elevation: elevation,
              pressedElevation: pressedElevation,
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
                  PropertyLabel(
                    onTextChange: (value) => setState(() {
                      label = value;
                    }),
                    initialValue: label,
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
                  PropertyColorChange(
                    propertyName: 'labelColor',
                    colors: labelColors,
                    onColorChange: (value) => setState(() {
                      labelColor = value;
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
