import 'package:flutter/material.dart';

class PropertyRow extends StatelessWidget {
  const PropertyRow({
    super.key,
    required this.propertyName,
    required this.propertyWidget,
  });

  final String propertyName;
  final Widget propertyWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              propertyName,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: propertyWidget),
        ],
      ),
    );
  }
}
