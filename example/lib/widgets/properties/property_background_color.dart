import 'package:flutter/material.dart';

import 'property_row.dart';

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
