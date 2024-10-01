import 'package:example/widgets/properties/property_row.dart';
import 'package:flutter/material.dart';

class PropertyColorChange extends StatelessWidget {
  const PropertyColorChange({
    super.key,
    required this.propertyName,
    required this.colors,
    required this.onColorChange,
  });

  final String propertyName;
  final ValueChanged<Color> onColorChange;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: propertyName,
      propertyWidget: Wrap(
        children: colors
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

const backgroundColors = Colors.primaries;
const labelColors = [
  Colors.white,
  Colors.black,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple,
];
