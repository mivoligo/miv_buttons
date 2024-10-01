import 'package:flutter/material.dart';

import 'property_row.dart';

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
