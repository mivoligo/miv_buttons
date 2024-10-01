import 'package:flutter/material.dart';

import 'property_row.dart';

class PropertyLabel extends StatelessWidget {
  const PropertyLabel({
    super.key,
    required this.onTextChange,
    required this.initialValue,
  });

  final String initialValue;
  final ValueChanged<String> onTextChange;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'label',
      propertyWidget: TextFormField(
        decoration: const InputDecoration(filled: true),
        initialValue: initialValue,
        onChanged: (value) => onTextChange(value),
      ),
    );
  }
}
