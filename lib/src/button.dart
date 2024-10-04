import 'package:flutter/widgets.dart';
import 'package:miv_buttons/src/defaults.dart';

enum Shape {
  circle,
  roundedRectangle,
  stadium,
  rectangle,
}

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onClick,
    required this.child,
    this.color,
    this.shape,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.elevation,
    this.pressedElevation,
  })  : assert(
          horizontalPadding == null || horizontalPadding >= 0,
          'horizontalPadding cannot be negative',
        ),
        assert(
          verticalPadding == null || verticalPadding >= 0,
          'verticalPadding cannot be negative',
        ),
        assert(
          elevation == null || elevation >= 0,
          'elevation cannot be negative',
        ),
        assert(
          pressedElevation == null || pressedElevation >= 0,
          'pressedElevation cannot be negative',
        );

  /// The callback function that is triggered when the button is clicked.
  ///
  /// If `null`, the button will be disabled and will not respond to any tap
  /// or click events. When provided, this function will be called
  /// whenever the button is pressed.
  ///
  /// Example:
  /// ```dart
  /// Button(
  ///   onClick: () {
  ///     print('Button pressed!');
  ///   },
  /// );
  /// ```
  ///
  /// See also: [VoidCallback] for more information on the function type.
  final VoidCallback? onClick;

  /// The widget which is inside the button.
  ///
  /// It could be any widget, for example [Text], [Icon], [Row]
  final Widget child;

  /// The color of the button.
  ///
  /// Defines the color of the button, applied it's surface.
  /// If `null`, the default color ([kColor]) will be used.
  final Color? color;
  final Shape? shape;

  /// The border radius of the button.
  ///
  /// Determines the roundness of the corners of the button in pixels.
  /// If `null`, the default border radius ([kBorderRadius]) will be applied.
  final double? borderRadius;

  /// The horizontal padding inside the button.
  ///
  /// Defines the amount of horizontal padding between the content (like text or icon)
  /// and the edges of the button.
  /// If `null`, the default horizontal padding ([kHorizontalPadding]) will be applied.
  final double? horizontalPadding;

  /// The vertical padding inside the button.
  ///
  /// Defines the amount of vertical padding between the content  (like text or icon)
  /// and the edges of the button.
  /// If `null`, the default vertical padding ([kVerticalPadding]) will be applied.
  final double? verticalPadding;

  /// The elevation of the button.
  ///
  /// Specifies the elevation of the button, making it appear raised above the surface.
  /// If `null`, the default elevation ([kElevation]) for the button will be applied.
  final double? elevation;

  /// The elevation of the button when pressed.
  ///
  /// Specifies the elevation of the button, making it appear raised above the surface.
  /// If `null`, the default pressed elevation ([kPressedElevation]) for the button will be applied.
  final double? pressedElevation;

  factory Button.icon({
    required VoidCallback? onClick,
    required IconData icon,
    Shape? shape,
    Color? iconColor,
    Color? color,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? elevation,
    double? pressedElevation,
    Key? key,
  }) {
    return Button(
      key: key,
      onClick: onClick,
      shape: shape,
      color: color,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      child: Icon(
        icon,
        color: iconColor ?? kForegroundColor,
      ),
    );
  }

  factory Button.label({
    required VoidCallback? onClick,
    required String label,
    Shape? shape,
    TextStyle? labelStyle,
    Color? color,
    Color? labelColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? elevation,
    double? pressedElevation,
    Key? key,
  }) {
    return Button(
      key: key,
      onClick: onClick,
      shape: shape,
      color: color,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      child: Text(
        label,
        style: labelStyle ??
            const TextStyle(color: kForegroundColor)
                .copyWith(color: labelColor),
      ),
    );
  }

  factory Button.iconLabel({
    required VoidCallback? onClick,
    required IconData icon,
    required String label,
    bool isHorizontal = true,
    double? gap,
    Shape? shape,
    TextStyle? labelStyle,
    Color? color,
    Color? foregroundColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? elevation,
    double? pressedElevation,
  }) {
    return Button(
      onClick: onClick,
      shape: shape,
      color: color,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      child: Flex(
        direction: isHorizontal ? Axis.horizontal : Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: foregroundColor),
          if (isHorizontal)
            SizedBox(width: gap ?? kLabelIconGap)
          else
            SizedBox(height: gap ?? kLabelIconGap),
          Text(
            label,
            style: labelStyle ??
                const TextStyle().copyWith(color: foregroundColor),
          ),
        ],
      ),
    );
  }
  factory Button.labelIcon({
    required VoidCallback? onClick,
    required IconData icon,
    required String label,
    bool isHorizontal = true,
    double? gap,
    Shape? shape,
    TextStyle? labelStyle,
    Color? color,
    Color? foregroundColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? elevation,
    double? pressedElevation,
  }) {
    return Button(
      onClick: onClick,
      shape: shape,
      color: color,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      child: Flex(
        direction: isHorizontal ? Axis.horizontal : Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: labelStyle ??
                const TextStyle().copyWith(color: foregroundColor),
          ),
          if (isHorizontal)
            SizedBox(width: gap ?? kLabelIconGap)
          else
            SizedBox(height: gap ?? kLabelIconGap),
          Icon(icon, color: foregroundColor),
        ],
      ),
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
          SizedBox(
            height: isPressed
                ? (widget.elevation ?? kElevation)
                : (widget.pressedElevation ?? kPressedElevation),
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: isPressed
                  ? (widget.pressedElevation ?? kPressedElevation)
                  : (widget.elevation ?? kElevation),
            ),
            decoration: BoxDecoration(
              color: HSLColor.fromColor(
                widget.color != null ? widget.color! : kColor,
              ).withLightness(0.3).toColor(),
              borderRadius:
                  _borderRadius(Shape.roundedRectangle, widget.borderRadius),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding ?? kHorizontalPadding,
                vertical: widget.verticalPadding ?? kVerticalPadding,
              ),
              decoration: BoxDecoration(
                color: widget.color ?? kColor,
                borderRadius:
                    _borderRadius(Shape.roundedRectangle, widget.borderRadius),
                boxShadow: [
                  // black blurry shadow
                  BoxShadow(
                    color: kShadowColor,
                    offset: isPressed
                        ? Offset(
                            0,
                            widget.pressedElevation ?? kPressedElevation,
                          )
                        : Offset(0, widget.elevation ?? kElevation),
                    blurRadius: isPressed
                        ? (widget.pressedElevation ?? kPressedElevation)
                        : (widget.elevation ?? kElevation),
                    blurStyle: BlurStyle.outer,
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
    Shape.roundedRectangle =>
      BorderRadius.all(Radius.circular(radius ?? kBorderRadius)),
    Shape.stadium || Shape.circle => null,
    Shape.rectangle => BorderRadius.zero,
    _ => const BorderRadius.all(Radius.circular(kBorderRadius)),
  };
}

// BoxShape _boxShape(Shape? shape) {
//   return switch (shape) {
//     Shape.roundedRectangle => BoxShape.rectangle,
//     Shape.circle => BoxShape.circle,
//     _ => BoxShape.rectangle,
//   };
// }
