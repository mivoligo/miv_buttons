import 'package:example/widgets/properties/property_row.dart';
import 'package:flutter/material.dart';

class PropertyIcon extends StatelessWidget {
  const PropertyIcon({
    super.key,
    required this.onIconChange,
  });

  final ValueChanged<IconData> onIconChange;

  @override
  Widget build(BuildContext context) {
    return PropertyRow(
      propertyName: 'icon',
      propertyWidget: Wrap(
        children: [
          Icons.fingerprint,
          Icons.add,
          Icons.accessibility,
          Icons.beach_access,
          Icons.cake,
          Icons.face,
          Icons.get_app_outlined,
          Icons.monitor_heart,
        ].map(
          (e) {
            return InkWell(
              onTap: () => onIconChange(e),
              child: SizedBox(
                width: 48,
                height: 48,
                child: Icon(e),
              ),
            );
          },
        ).toList(growable: false),
      ),
    );
  }
}
