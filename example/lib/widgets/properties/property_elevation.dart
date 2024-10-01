import 'package:example/widgets/properties/property_row.dart';
import 'package:example/widgets/properties/value_changer.dart';
import 'package:flutter/material.dart';

class PropertyElevation extends StatelessWidget {
  const PropertyElevation({
    super.key,
    required this.onElevationChanged,
    required this.initialElevation,
  });

  final ValueChanged<double> onElevationChanged;
  final double initialElevation;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'elevation',
      propertyWidget: ValueChanger(
        onValueChanged: onElevationChanged,
        initialValue: initialElevation,
      ),
    );
  }
}
