import 'package:example/widgets/properties/property_row.dart';
import 'package:flutter/material.dart';

class PropertyBool extends StatelessWidget {
  const PropertyBool({
    super.key,
    required this.propertyName,
    required this.defaultValue,
    required this.onChanged,
  });

  final String propertyName;
  final bool defaultValue;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: propertyName,
      propertyWidget: Row(
        children: [
          Switch.adaptive(value: defaultValue, onChanged: onChanged),
        ],
      ),
    );
  }
}
