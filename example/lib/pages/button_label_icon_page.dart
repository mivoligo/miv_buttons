import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import '../widgets/properties/properties.dart';

class ButtonLabelIconPage extends StatelessWidget {
  const ButtonLabelIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button.iconLabel')),
      body: const _ButtonWithLabelIcon(),
      backgroundColor: Colors.grey.shade200,
    );
  }
}

class _ButtonWithLabelIcon extends StatefulWidget {
  const _ButtonWithLabelIcon();

  @override
  State<_ButtonWithLabelIcon> createState() => _ButtonWithLabelIconState();
}

class _ButtonWithLabelIconState extends State<_ButtonWithLabelIcon> {
  String label = 'PRESS ME!';
  IconData icon = Icons.fingerprint;
  double iconSize = 20;
  Color color = Colors.blue;
  Color foregroundColor = Colors.white;
  double borderRadius = 8;
  double horizontalPadding = 12;
  double verticalPadding = 8;
  double elevation = 6;
  double pressedElevation = 2;
  bool isHorizontal = true;
  double gap = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Button.labelIcon(
              onClick: () {},
              icon: icon,
              iconSize: iconSize,
              label: label,
              isHorizontal: isHorizontal,
              gap: gap,
              color: color,
              foregroundColor: foregroundColor,
              borderRadius: borderRadius,
              horizontalPadding: horizontalPadding,
              verticalPadding: verticalPadding,
              elevation: elevation,
              pressedElevation: pressedElevation,
              semanticLabel: 'An example button with a label and an icon',
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
                  PropertyIcon(
                    onIconChange: (iconData) => setState(() {
                      icon = iconData;
                    }),
                  ),
                  const Divider(height: 16),
                  PropertyBool(
                    propertyName: 'isHorizontal',
                    defaultValue: isHorizontal,
                    onChanged: (value) => setState(() {
                      isHorizontal = value;
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
                  PropertyColorChange(
                    propertyName: 'foregroundColor',
                    colors: labelColors,
                    onColorChange: (value) => setState(() {
                      foregroundColor = value;
                    }),
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    propertyName: 'gap',
                    initialValue: gap,
                    onValueChanged: (value) {
                      setState(() {
                        gap = value;
                      });
                    },
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    propertyName: 'iconSize',
                    initialValue: iconSize,
                    onValueChanged: (value) {
                      setState(() {
                        iconSize = value;
                      });
                    },
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
