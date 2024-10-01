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
    this.horizontalPadding,
    this.verticalPadding,
    this.elevation,
    this.pressedElevation,
  });

  final VoidCallback? onClick;
  final Widget child;
  final Color? backgroundColor;
  final Shape? shape;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? elevation;
  final double? pressedElevation;

  factory Button.icon({
    required VoidCallback? onClick,
    required IconData icon,
    Shape? shape,
    Color? iconColor,
    Color? backgroundColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? elevation,
    double? pressedElevation,
    Key? key,
  }) {
    return Button._(
      key: key,
      onClick: onClick,
      shape: shape,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      child: Icon(
        icon,
        color: iconColor ?? const Color(0xFFFEFEFE),
      ),
    );
  }

  factory Button.label({
    required VoidCallback? onClick,
    required String label,
    Shape? shape,
    TextStyle? labelStyle,
    Color? backgroundColor,
    Color? labelColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? elevation,
    double? pressedElevation,
    Key? key,
  }) {
    return Button._(
      key: key,
      onClick: onClick,
      shape: shape,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      child: Text(
        label,
        style: labelStyle ??
            const TextStyle(color: Color(0xFFFEFEFE))
                .copyWith(color: labelColor),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: isPressed ? (widget.elevation ?? 8) : 0),
          Container(
            padding: EdgeInsets.only(
              bottom: isPressed
                  ? (widget.pressedElevation ?? 0)
                  : (widget.elevation ?? 8),
            ),
            decoration: BoxDecoration(
              color: widget.backgroundColor != null
                  ? HSLColor.fromColor(widget.backgroundColor!)
                      // .withLightness(0.3)
                      .toColor()
                  : const Color(0xFF9C27B0),
              borderRadius:
                  _borderRadius(Shape.roundedRectangle, widget.borderRadius),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding ?? 8,
                vertical: widget.verticalPadding ?? 8,
              ),
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? const Color(0xFF9C27B0),
                borderRadius:
                    _borderRadius(Shape.roundedRectangle, widget.borderRadius),
                boxShadow: [
                  // black blurry shadow
                  BoxShadow(
                    color: const Color(0xDD222222),
                    offset: isPressed
                        ? Offset(0, widget.pressedElevation ?? 2)
                        : Offset(0, widget.elevation ?? 8),
                    blurRadius: isPressed
                        ? (widget.pressedElevation ?? 2)
                        : (widget.elevation ?? 8) + 4,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ],
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
