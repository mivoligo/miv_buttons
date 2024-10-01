import 'package:flutter/widgets.dart';

enum Shape {
  circle,
  roundedRectangle,
  stadium,
  rectangle,
}

class Button extends StatefulWidget {
  const Button._({
    super.key,
    required this.onClick,
    required this.child,
    this.backgroundColor,
    this.shape,
    this.borderRadius,
  });

  final VoidCallback? onClick;
  final Widget child;
  final Color? backgroundColor;
  final Shape? shape;
  final double? borderRadius;

  factory Button.icon({
    required VoidCallback? onClick,
    required IconData icon,
    Shape? shape,
    Color? iconColor,
    Color? backgroundColor,
    Key? key,
  }) {
    return Button._(
      key: key,
      onClick: onClick,
      shape: shape,
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }

  factory Button.label({
    required VoidCallback? onClick,
    required String label,
    Shape? shape,
    TextStyle? labelStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
    Key? key,
  }) {
    return Button._(
      key: key,
      onClick: onClick,
      shape: shape,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      child: Text(
        label,
        style: labelStyle ?? const TextStyle().copyWith(color: foregroundColor),
      ),
    );
  }

  factory Button.widget({
    required VoidCallback? onClick,
    required Widget child,
    Shape? shape,
    Key? key,
  }) {
    return Button._(
      key: key,
      onClick: onClick,
      shape: shape,
      child: child,
    );
  }

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: (_) => setState(() {
        isPressed = true;
      }),
      onTapUp: (_) => setState(() {
        isPressed = false;
      }),
      onTapCancel: () => setState(() {
        isPressed = false;
      }),
      child: Transform.translate(
        offset: isPressed ? const Offset(0, 6) : Offset.zero,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // color of the button's surface
            color: widget.backgroundColor ?? const Color(0xFFEF4444),
            borderRadius:
                _borderRadius(Shape.roundedRectangle, widget.borderRadius),
            shape: _boxShape(widget.shape),
            boxShadow: [
              // black blurry shadow
              BoxShadow(
                  color: const Color(0xEE222222),
                  offset: isPressed ? const Offset(0, 2) : const Offset(0, 8),
                  blurRadius: isPressed ? 2 : 12,
                  blurStyle: BlurStyle.outer),
              // side of the button
              BoxShadow(
                color: widget.backgroundColor != null
                    ? HSLColor.fromColor(widget.backgroundColor!)
                        .withLightness(0.3)
                        .toColor()
                    : const Color(0xFF991B1B),
                offset: isPressed ? const Offset(0, 2) : const Offset(0, 8),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

BorderRadius? _borderRadius(Shape? shape, double? radius) {
  return switch (shape) {
    Shape.roundedRectangle => BorderRadius.all(Radius.circular(radius ?? 8)),
    Shape.stadium || Shape.circle => null,
    Shape.rectangle => BorderRadius.zero,
    _ => const BorderRadius.all(Radius.circular(8)),
  };
}

BoxShape _boxShape(Shape? shape) {
  return switch (shape) {
    Shape.roundedRectangle => BoxShape.rectangle,
    Shape.circle => BoxShape.circle,
    _ => BoxShape.rectangle,
  };
}
