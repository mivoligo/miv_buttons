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
        crossAxisAlignment: CrossAxisAlignment.end,
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
          const SizedBox(width: 16),
          SizedBox(
            width: 36,
            child: Center(
              child: Text(
                borderRadius.toStringAsFixed(0),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Button.icon(
            onClick: () {
              if (borderRadius < 50) {
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
