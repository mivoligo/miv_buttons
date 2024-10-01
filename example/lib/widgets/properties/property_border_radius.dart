import 'package:example/widgets/properties/value_changer.dart';
import 'package:flutter/material.dart';

import 'property_row.dart';

class PropertyBorderRadius extends StatelessWidget {
  const PropertyBorderRadius({
    super.key,
    required this.onRadiusChange,
    required this.borderRadius,
  });

  final ValueChanged onRadiusChange;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'borderRadius',
      propertyWidget: ValueChanger(
        onValueChanged: onRadiusChange,
        initialValue: borderRadius,
      ),
    );
  }
}
