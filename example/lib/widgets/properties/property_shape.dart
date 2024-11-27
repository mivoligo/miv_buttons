import 'package:example/widgets/properties/property_row.dart';
import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

class PropertyShape extends StatelessWidget {
  const PropertyShape({
    super.key,
    required this.shape,
    required this.onShapeChange,
  });

  final Shape shape;
  final ValueChanged<Shape> onShapeChange;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'shape',
      propertyWidget: DropdownButton<Shape>(
        value: shape,
        items: Shape.values.map(
          (e) {
            return DropdownMenuItem<Shape>(
              value: e,
              child: Text(e.toString()),
            );
          },
        ).toList(growable: false),
        onChanged: (value) => onShapeChange(value!),
      ),
    );
  }
}
