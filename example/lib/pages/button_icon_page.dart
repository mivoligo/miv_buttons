import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import '../widgets/properties/properties.dart';

class ButtonIconPage extends StatelessWidget {
  const ButtonIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button.icon')),
      body: const _ButtonWithIcon(),
      backgroundColor: Colors.grey.shade200,
    );
  }
}

class _ButtonWithIcon extends StatefulWidget {
  const _ButtonWithIcon();

  @override
  State<_ButtonWithIcon> createState() => _ButtonWithIconState();
}

class _ButtonWithIconState extends State<_ButtonWithIcon> {
  IconData icon = Icons.fingerprint;
  Color color = Colors.green;
  Color iconColor = Colors.white;
  double iconSize = 20;
  double borderRadius = 8;
  double horizontalPadding = 12;
  double verticalPadding = 8;
  double elevation = 6;
  double pressedElevation = 2;
  Shape shape = Shape.rectangle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Button.icon(
              onClick: () {},
              icon: icon,
              iconSize: iconSize,
              color: color,
              iconColor: iconColor,
              borderRadius: borderRadius,
              horizontalPadding: horizontalPadding,
              verticalPadding: verticalPadding,
              elevation: elevation,
              pressedElevation: pressedElevation,
              shape: shape,
              semanticLabel: 'An example button with an icon',
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
                  PropertyIcon(
                    onIconChange: (iconData) => setState(() {
                      icon = iconData;
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
                    propertyName: 'iconColor',
                    colors: labelColors,
                    onColorChange: (value) => setState(() {
                      iconColor = value;
                    }),
                  ),
                  const Divider(height: 16),
                  PropertyValueChange(
                    key: const Key('iconSize'),
                    propertyName: 'iconSize',
                    initialValue: iconSize,
                    onValueChanged: (value) {
                      setState(() {
                        iconSize = value;
                      });
                    },
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
