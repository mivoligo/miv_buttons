import 'package:flutter/widgets.dart';
import 'package:miv_buttons/src/defaults.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onClick,
    required this.child,
    this.color,
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

  factory Button.icon({
    required VoidCallback? onClick,
    required IconData icon,
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

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.onClick == null;

    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: isDisabled
          ? null
          : (_) => setState(() {
                isPressed = true;
              }),
      onTapUp: isDisabled
          ? null
          : (_) => setState(() {
                isPressed = false;
              }),
      onTapCancel: isDisabled
          ? null
          : () => setState(() {
                isPressed = false;
              }),
      child: CustomPaint(
        painter: ButtonPainter(
          borderRadius: widget.borderRadius ?? kBorderRadius,
          elevation: widget.elevation ?? kElevation,
          pressedElevation: widget.pressedElevation ?? kPressedElevation,
          color: widget.color ?? kColor,
          isPressed: isPressed,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
                horizontal: widget.horizontalPadding ?? kHorizontalPadding,
                vertical: widget.verticalPadding ?? kVerticalPadding,
              ) +
              EdgeInsets.only(
                bottom: isPressed
                    ? widget.pressedElevation ?? kPressedElevation
                    : widget.elevation ?? kElevation,
              ) +
              EdgeInsets.only(
                top: isPressed
                    ? (widget.elevation ?? kElevation) -
                        (widget.pressedElevation ?? kPressedElevation)
                    : 0,
              ),
          child: widget.child,
        ),
      ),
    );
  }
}

class ButtonPainter extends CustomPainter {
  ButtonPainter({
    super.repaint,
    required this.borderRadius,
    required this.elevation,
    required this.pressedElevation,
    required this.color,
    required this.isPressed,
  });

  final double borderRadius;
  final double elevation;
  final double pressedElevation;
  final Color color;
  final bool isPressed;

  @override
  void paint(Canvas canvas, Size size) {
    const sideDarkerColor = Color(0x45222222);
    const shadowColor = Color(0xff222222);

    final surfaceRect = Rect.fromLTWH(
      0,
      isPressed ? elevation - pressedElevation : 0,
      size.width,
      size.height - (isPressed ? elevation : elevation),
    );

    final sideRect = Rect.fromLTWH(
      0,
      surfaceRect.top + borderRadius,
      size.width,
      isPressed
          ? surfaceRect.height + pressedElevation - borderRadius
          : surfaceRect.height + elevation - borderRadius,
    );

    final surfacePaint = Paint()..color = color;
    final sidePaint = Paint()..color = sideDarkerColor;

    final surfaceRRect =
        RRect.fromRectAndRadius(surfaceRect, Radius.circular(borderRadius));

    final sideRRect = RRect.fromRectAndCorners(
      sideRect,
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    final shadowPath = Path()..addRRect(sideRRect);

    if (isPressed && pressedElevation > 0 || !isPressed && elevation > 0) {
      canvas.drawShadow(
        shadowPath,
        shadowColor,
        isPressed ? pressedElevation : elevation,
        true,
      );

      canvas.drawRRect(sideRRect, surfacePaint);
      canvas.drawRRect(sideRRect, sidePaint);
    }
    canvas.drawRRect(surfaceRRect, surfacePaint);
  }

  @override
  bool shouldRepaint(covariant ButtonPainter oldDelegate) {
    return oldDelegate.isPressed != isPressed ||
        oldDelegate.color != color ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.elevation != elevation ||
        oldDelegate.pressedElevation != pressedElevation;
  }
}
