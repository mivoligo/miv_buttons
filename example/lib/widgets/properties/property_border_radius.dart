import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

import 'property_row.dart';

class PropertyBorderRadius extends StatefulWidget {
  const PropertyBorderRadius({
    super.key,
    required this.onRadiusChange,
    required this.borderRadius,
  });

  final ValueChanged onRadiusChange;
  final double borderRadius;

  @override
  State<PropertyBorderRadius> createState() => _PropertyBorderRadiusState();
}

class _PropertyBorderRadiusState extends State<PropertyBorderRadius> {
  late double borderRadius;

  @override
  void initState() {
    super.initState();
    borderRadius = widget.borderRadius;
  }

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'borderRadius',
      propertyWidget: Row(
        children: [
          Button.icon(
            onClick: () {
              if (borderRadius > 0) {
                setState(() {
                  borderRadius--;
                  widget.onRadiusChange(borderRadius);
                });
              }
            },
            icon: Icons.remove,
          ),
          Text(borderRadius.toString()),
          Button.icon(
            onClick: () {
              if (borderRadius < 100) {
                setState(() {
                  borderRadius++;
                  widget.onRadiusChange(borderRadius);
                });
              }
            },
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
