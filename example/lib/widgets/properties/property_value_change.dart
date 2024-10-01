import 'package:example/widgets/properties/property_row.dart';
import 'package:example/widgets/properties/value_changer.dart';
import 'package:flutter/material.dart';

class PropertyValueChange extends StatelessWidget {
  const PropertyValueChange({
    super.key,
    required this.propertyName,
    required this.initialValue,
    required this.onValueChanged,
    this.minValue = 0,
    this.maxValue = 50,
  });

  final String propertyName;
  final double initialValue;
  final double minValue;
  final double maxValue;
  final ValueChanged<double> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: propertyName,
      propertyWidget: ValueChanger(
        onValueChanged: onValueChanged,
        initialValue: initialValue,
        maxValue: maxValue,
        minValue: minValue,
      ),
    );
  }
}
