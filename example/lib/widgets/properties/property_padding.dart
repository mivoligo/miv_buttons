import 'package:example/widgets/properties/property_row.dart';
import 'package:example/widgets/properties/value_changer.dart';
import 'package:flutter/material.dart';

class PropertyPadding extends StatelessWidget {
  const PropertyPadding({
    super.key,
    required this.propertyName,
    required this.onValueChanged,
    required this.initialValue,
  });

  final ValueChanged<double> onValueChanged;
  final double initialValue;
  final String propertyName;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: propertyName,
      propertyWidget: ValueChanger(
        onValueChanged: onValueChanged,
        initialValue: initialValue,
      ),
    );
  }
}
