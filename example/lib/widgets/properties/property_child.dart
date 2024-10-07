import 'package:example/widgets/properties/property_row.dart';
import 'package:flutter/material.dart';

class PropertyChild extends StatelessWidget {
  const PropertyChild({
    super.key,
    required this.onValueChange,
  });

  final ValueChanged<Widget> onValueChange;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'child',
      propertyWidget: Wrap(
        runSpacing: 16,
        spacing: 32,
        children: widgets
            .map(
              (widget) => InkWell(
                onTap: () => onValueChange(widget),
                child: widget,
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

const widgets = <Widget>[
  Column(
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.sunny),
          Icon(Icons.access_alarms),
        ],
      ),
      Text('PRESS ME!'),
      Icon(Icons.add),
    ],
  ),
  Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.adb,
        color: Colors.indigo,
      ),
      Text(
        'text here',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      Icon(
        Icons.flutter_dash,
        color: Colors.redAccent,
      ),
    ],
  ),
  Image(
    image: AssetImage('assets/images/dash-says-hi.png'),
  ),
];
