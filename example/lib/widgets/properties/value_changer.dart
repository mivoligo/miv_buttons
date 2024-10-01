import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';

class ValueChanger extends StatefulWidget {
  const ValueChanger({
    super.key,
    required this.onValueChanged,
    required this.initialValue,
  });

  final ValueChanged<double> onValueChanged;
  final double initialValue;

  @override
  State<ValueChanger> createState() => _ValueChangerState();
}

class _ValueChangerState extends State<ValueChanger> {
  late double value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Button.icon(
          onClick: () {
            if (value > 0) {
              setState(() {
                value--;
                widget.onValueChanged(value);
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
              value.toStringAsFixed(0),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Button.icon(
          onClick: () {
            if (value < 50) {
              setState(() {
                value++;
                widget.onValueChanged(value);
              });
            }
          },
          icon: Icons.add,
        ),
      ],
    );
  }
}
