import 'package:flutter/widgets.dart';
import 'package:miv_buttons/src/defaults.dart';

/// A customizable button widget with padding, elevation, color and other options.
///
/// This button widget is flexible and allows for easy customization of layout, colors, padding, and elevations.
/// It also provides a callback for handling tap or click events. The button also accepts a custom widget
/// as its child content.
///
/// Properties:
///
/// * [onClick]: The callback function triggered when the button is pressed. If `null`, the button is disabled and will not respond to tap or click events.
/// * [onLongPress]: The callback function triggered when a pointer has remained in contact with the screen at the same location for a long period of time.
/// * [onLongPressUp]: The callback function triggered when a pointer that has triggered a long-press has stopped contacting the screen.
/// * [child]: The widget displayed inside the button. Typically used to display text, icons, or other UI elements.
/// * [color]: The color of the button. If not specified, the default color ([0xFF2196F3]) will be used.
/// * [borderRadius]: The border radius of the button, defining the roundness of its corners. If `null`, the default border radius ([8.0]) will be used.
/// * [horizontalPadding]: The horizontal padding inside the button between its content (icon and label) and its edges. If `null`, the default horizontal padding ([12.0]) will be applied.
/// * [verticalPadding]: The vertical padding inside the button between its content and its edges. If `null`, the default vertical padding ([8.0]) will be applied.
/// * [elevation]: The elevation of the button, making it appear raised above the surface. If not specified, the default elevation ([6.0]) will be applied.
/// * [pressedElevation]: The elevation of the button when pressed. If not specified, the default pressed elevation ([2.0]) will be used.
/// * [semanticLabel]: The semantic label for the button that will be announced by screen readers. This label does not show in the UI.
/// * [excludeSemantics]: Whether to replace all child semantics with this node. Defaults to [false].
///
/// Example usage:
///
/// ```dart
/// Button(
///   onClick: () {
///     print('Button pressed');
///   },
///   child: Text('Click me'),
///   color: Colors.blue,
///   borderRadius: 12.0,
///   horizontalPadding: 16.0,
///   verticalPadding: 12.0,
///   elevation: 8.0,
///   pressedElevation: 0.0,
///   semanticLabel: 'I am clickable',
///   excludeSemantics: true,
/// );
/// ```
class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onClick,
    required this.child,
    this.color = kColor,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.elevation = kElevation,
    this.pressedElevation = kPressedElevation,
    this.semanticLabel,
    this.excludeSemantics,
    this.onLongPress,
    this.onLongPressUp,
  })  : assert(
          horizontalPadding == null || horizontalPadding >= 0,
          'horizontalPadding cannot be negative',
        ),
        assert(
          verticalPadding == null || verticalPadding >= 0,
          'verticalPadding cannot be negative',
        ),
        assert(
          elevation >= 0,
          'elevation cannot be negative',
        ),
        assert(
          pressedElevation >= 0,
          'pressedElevation cannot be negative',
        );

  /// A customizable button widget with an icon.
  ///
  /// This button widget is flexible and allows for easy customization of layout, colors, padding, and elevations.
  /// It also provides a callback for handling tap or click events.
  ///
  /// Properties:
  ///
  /// * [onClick]: The callback function triggered when the button is pressed. If `null`, the button is disabled and will not respond to tap or click events.
  /// * [onLongPress]: The callback function triggered when a pointer has remained in contact with the screen at the same location for a long period of time.
  /// * [onLongPressUp]: The callback function triggered when a pointer that has triggered a long-press has stopped contacting the screen.
  /// * [icon]: The icon displayed on the button. This is required and should be an `IconData` object.
  /// * [iconSize]: The size of the icon. If not specified, the default size ([20.0]) will be used.
  /// * [color]: The color of the button. If not specified, the default color ([0xFF2196F3]) will be used.
  /// * [iconColor]: The color applied to the icon. If not specified, the default icon color ([0xFFFFFFFF]) will be used.
  /// * [borderRadius]: The border radius of the button, defining the roundness of its corners. If `null`, the default border radius ([8.0]) will be used.
  /// * [horizontalPadding]: The horizontal padding inside the button between its content (icon and label) and its edges. If `null`, the default horizontal padding ([12.0]) will be applied.
  /// * [verticalPadding]: The vertical padding inside the button between its content and its edges. If `null`, the default vertical padding ([8.0]) will be applied.
  /// * [elevation]: The elevation of the button, making it appear raised above the surface. If not specified, the default elevation ([6.0]) will be applied.
  /// * [pressedElevation]: The elevation of the button when pressed. If not specified, the default pressed elevation ([2.0]) will be used.
  /// * [semanticLabel]: The semantic label for the button that will be announced by screen readers. This label does not show in the UI.
  /// * [excludeSemantics]: Whether to replace all child semantics with this node. Defaults to [false].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// Button.icon(
  ///   onClick: () {
  ///     print('Button pressed');
  ///   },
  ///   icon: Icons.add,
  ///   iconSize: 16.0,
  ///   color: Colors.blue,
  ///   iconColor: Colors.white,
  ///   borderRadius: 12.0,
  ///   horizontalPadding: 16.0,
  ///   verticalPadding: 12.0,
  ///   elevation: 8.0,
  ///   pressedElevation: 0.0,
  ///   semanticLabel: 'Increase value by one',
  ///   excludeSemantics: true,
  /// );
  /// ```
  factory Button.icon({
    required VoidCallback? onClick,
    required IconData icon,
    Color iconColor = kForegroundColor,
    double iconSize = kIconSize,
    Color color = kColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double elevation = kElevation,
    double pressedElevation = kPressedElevation,
    String? semanticLabel,
    bool? excludeSemantics,
    VoidCallback? onLongPress,
    VoidCallback? onLongPressUp,
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
      semanticLabel: semanticLabel,
      excludeSemantics: excludeSemantics,
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }

  /// A customizable button widget with a label.
  ///
  /// This button widget is flexible and allows for easy customization of layout, colors, padding, and elevations.
  /// It also provides a callback for handling tap or click events.
  ///
  /// Properties:
  ///
  /// * [onClick]: The callback function triggered when the button is pressed. If `null`, the button is disabled and will not respond to tap or click events.
  /// * [onLongPress]: The callback function triggered when a pointer has remained in contact with the screen at the same location for a long period of time.
  /// * [onLongPressUp]: The callback function triggered when a pointer that has triggered a long-press has stopped contacting the screen.
  /// * [label]: The text label displayed on the button. This is required and should be a string.
  /// * [labelStyle]: The text style applied to the label. If `null`, the default text style will be used.
  /// * [color]: The color of the button. If not specified, the default color ([0xFF2196F3]) will be used.
  /// * [labelColor]: The color applied to the label. The color of the label could also be changed by setting the color in [labelStyle].  If not specified, the default foreground color ([0xFFFFFFFF]) will be used.
  /// * [borderRadius]: The border radius of the button, defining the roundness of its corners. If `null`, the default border radius ([8.0]) will be used.
  /// * [horizontalPadding]: The horizontal padding inside the button between its content (icon and label) and its edges. If `null`, the default horizontal padding ([12.0]) will be applied.
  /// * [verticalPadding]: The vertical padding inside the button between its content and its edges. If `null`, the default vertical padding ([8.0]) will be applied.
  /// * [elevation]: The elevation of the button, making it appear raised above the surface. If not specified, the default elevation ([6.0]) will be applied.
  /// * [pressedElevation]: The elevation of the button when pressed. If not specified, the default pressed elevation ([2.0]) will be used.
  /// * [semanticLabel]: The semantic label for the button that will be announced by screen readers. This label does not show in the UI.
  /// * [excludeSemantics]: Whether to replace all child semantics with this node. Defaults to [false].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// Button.label(
  ///   onClick: () {
  ///     print('Button pressed');
  ///   },
  ///   label: 'Submit',
  ///   labelStyle: TextStyle(fontSize: 16, color: Colors.white),
  ///   color: Colors.blue,
  ///   labelColor: Colors.white,
  ///   borderRadius: 12.0,
  ///   horizontalPadding: 16.0,
  ///   verticalPadding: 12.0,
  ///   elevation: 8.0,
  ///   pressedElevation: 0.0,
  ///   semanticLabel: 'submit form',
  ///   excludeSemantics: true,
  /// );
  /// ```
  factory Button.label({
    required VoidCallback? onClick,
    required String label,
    TextStyle? labelStyle,
    Color color = kColor,
    Color labelColor = kForegroundColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double elevation = kElevation,
    double pressedElevation = kPressedElevation,
    String? semanticLabel,
    bool? excludeSemantics,
    VoidCallback? onLongPress,
    VoidCallback? onLongPressUp,
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
      semanticLabel: semanticLabel,
      excludeSemantics: excludeSemantics,
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: Text(
        label,
        style: labelStyle ?? const TextStyle().copyWith(color: labelColor),
      ),
    );
  }

  /// A customizable button widget with an icon and a label (in this order), supporting vertical or horizontal layout.
  ///
  /// This button widget is flexible and allows for easy customization of layout, colors, padding, and elevations.
  /// It also provides a callback for handling tap or click events.
  ///
  /// Properties:
  ///
  /// * [onClick]: The callback function triggered when the button is pressed. If `null`, the button is disabled and will not respond to tap or click events.
  /// * [onLongPress]: The callback function triggered when a pointer has remained in contact with the screen at the same location for a long period of time.
  /// * [onLongPressUp]: The callback function triggered when a pointer that has triggered a long-press has stopped contacting the screen.
  /// * [icon]: The icon displayed on the button. This is required and should be an `IconData` object.
  /// * [iconSize]: The size of the icon. If not specified, the default size ([20.0]) will be used.
  /// * [label]: The text label displayed next to (or under) the icon. This is required and should be a string.
  /// * [isHorizontal]: Determines the layout direction of the icon and the label. If `true` (default), the icon and the label are arranged horizontally; if `false`, they are arranged vertically.
  /// * [gap]: The space between the icon and the label. If not specified, the default gap ([8.0]) will be used.
  /// * [labelStyle]: The text style applied to the label. If `null`, the default text style will be used.
  /// * [color]: The color of the button. If not specified, the default color ([0xFF2196F3]) will be used.
  /// * [foregroundColor]: The color applied to the icon and label. The color of the label could also be changed by setting the color in [labelStyle].  If not specified, the default foreground color ([0xFFFFFFFF]) will be used.
  /// * [borderRadius]: The border radius of the button, defining the roundness of its corners. If `null`, the default border radius ([8.0]) will be used.
  /// * [horizontalPadding]: The horizontal padding inside the button between its content (icon and label) and its edges. If `null`, the default horizontal padding ([12.0]) will be applied.
  /// * [verticalPadding]: The vertical padding inside the button between its content and its edges. If `null`, the default vertical padding ([8.0]) will be applied.
  /// * [elevation]: The elevation of the button, making it appear raised above the surface. If not specified, the default elevation ([6.0]) will be applied.
  /// * [pressedElevation]: The elevation of the button when pressed. If not specified, the default pressed elevation ([2.0]) will be used.
  /// * [semanticLabel]: The semantic label for the button that will be announced by screen readers. This label does not show in the UI.
  /// * [excludeSemantics]: Whether to replace all child semantics with this node. Defaults to [false].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// Button.iconLabel(
  ///   onClick: () {
  ///     print('Button pressed');
  ///   },
  ///   icon: Icons.add,
  ///   iconSize: 16.0,
  ///   label: 'Add',
  ///   isHorizontal: true,
  ///   gap: 8.0,
  ///   labelStyle: TextStyle(fontSize: 16, color: Colors.white),
  ///   color: Colors.blue,
  ///   foregroundColor: Colors.white,
  ///   borderRadius: 12.0,
  ///   horizontalPadding: 16.0,
  ///   verticalPadding: 12.0,
  ///   elevation: 8.0,
  ///   pressedElevation: 0.0,
  ///   semanticLabel: 'add more llamas',
  ///   excludeSemantics: true,
  /// );
  /// ```
  /// Check also [Button.labelIcon] widget, which displays the icon on the right to (or under) the label.
  factory Button.iconLabel({
    required VoidCallback? onClick,
    required IconData icon,
    required String label,
    bool isHorizontal = true,
    double iconSize = kIconSize,
    double gap = kLabelIconGap,
    TextStyle? labelStyle,
    Color color = kColor,
    Color foregroundColor = kForegroundColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double elevation = kElevation,
    double pressedElevation = kPressedElevation,
    String? semanticLabel,
    bool? excludeSemantics,
    VoidCallback? onLongPress,
    VoidCallback? onLongPressUp,
  }) {
    return Button(
      onClick: onClick,
      color: color,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      semanticLabel: semanticLabel,
      excludeSemantics: excludeSemantics,
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: Flex(
        direction: isHorizontal ? Axis.horizontal : Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: foregroundColor,
            size: iconSize,
          ),
          if (isHorizontal) SizedBox(width: gap) else SizedBox(height: gap),
          Text(
            label,
            style: labelStyle ??
                const TextStyle().copyWith(color: foregroundColor),
          ),
        ],
      ),
    );
  }

  /// A customizable button widget with a label and an icon (in this order), supporting vertical or horizontal layout.
  ///
  /// This button widget is flexible and allows for easy customization of layout, colors, padding, and elevations.
  /// It also provides a callback for handling tap or click events.
  ///
  /// Properties:
  ///
  /// * [onClick]: The callback function triggered when the button is pressed. If `null`, the button is disabled and will not respond to tap or click events.
  /// * [onLongPress]: The callback function triggered when a pointer has remained in contact with the screen at the same location for a long period of time.
  /// * [onLongPressUp]: The callback function triggered when a pointer that has triggered a long-press has stopped contacting the screen.
  /// * [icon]: The icon displayed on the button. This is required and should be an `IconData` object.
  /// * [iconSize]: The size of the icon. If not specified, the default size ([20.0]) will be used.
  /// * [label]: The text label displayed next to (or over) the icon. This is required and should be a string.
  /// * [isHorizontal]: Determines the layout direction of the label and the icon. If `true` (default), the label and the icon are arranged horizontally; if `false`, they are arranged vertically.
  /// * [gap]: The space between the icon and the label. If not specified, the default gap ([8.0]) will be used.
  /// * [labelStyle]: The text style applied to the label. If `null`, the default text style will be used.
  /// * [color]: The color of the button. If not specified, the default color ([0xFF2196F3]) will be used.
  /// * [foregroundColor]: The color applied to the icon and label. The color of the label could also be changed by setting the color in [labelStyle].  If not specified, the default foreground color ([0xFFFFFFFF]) will be used.
  /// * [borderRadius]: The border radius of the button, defining the roundness of its corners. If `null`, the default border radius ([8.0]) will be used.
  /// * [horizontalPadding]: The horizontal padding inside the button between its content (icon and label) and its edges. If `null`, the default horizontal padding ([12.0]) will be applied.
  /// * [verticalPadding]: The vertical padding inside the button between its content and its edges. If `null`, the default vertical padding ([8.0]) will be applied.
  /// * [elevation]: The elevation of the button, making it appear raised above the surface. If not specified, the default elevation ([6.0]) will be applied.
  /// * [pressedElevation]: The elevation of the button when pressed. If not specified, the default pressed elevation ([2.0]) will be used.
  /// * [semanticLabel]: The semantic label for the button that will be announced by screen readers. This label does not show in the UI.
  /// * [excludeSemantics]: Whether to replace all child semantics with this node. Defaults to [false].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// Button.labelIcon(
  ///   onClick: () {
  ///     print('Button pressed');
  ///   },
  ///   icon: Icons.add,
  ///   iconSize: 16.0,
  ///   label: 'Add',
  ///   isHorizontal: true,
  ///   gap: 8.0,
  ///   labelStyle: TextStyle(fontSize: 16, color: Colors.white),
  ///   color: Colors.blue,
  ///   foregroundColor: Colors.white,
  ///   borderRadius: 12.0,
  ///   horizontalPadding: 16.0,
  ///   verticalPadding: 12.0,
  ///   elevation: 8.0,
  ///   pressedElevation: 0.0,
  ///   semanticLabel: 'add more llamas',
  ///   excludeSemantics: true,
  /// );
  /// ```
  /// Check also [Button.iconLabel] widget which displays the icon on the left to (or over) the label.
  factory Button.labelIcon({
    required VoidCallback? onClick,
    required IconData icon,
    required String label,
    bool isHorizontal = true,
    double iconSize = kIconSize,
    double gap = kLabelIconGap,
    TextStyle? labelStyle,
    Color color = kColor,
    Color foregroundColor = kForegroundColor,
    double? borderRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double elevation = kElevation,
    double pressedElevation = kPressedElevation,
    String? semanticLabel,
    bool? excludeSemantics,
    VoidCallback? onLongPress,
    VoidCallback? onLongPressUp,
  }) {
    return Button(
      onClick: onClick,
      color: color,
      borderRadius: borderRadius,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      elevation: elevation,
      pressedElevation: pressedElevation,
      semanticLabel: semanticLabel,
      excludeSemantics: excludeSemantics,
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: Flex(
        direction: isHorizontal ? Axis.horizontal : Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: labelStyle ??
                const TextStyle().copyWith(color: foregroundColor),
          ),
          if (isHorizontal) SizedBox(width: gap) else SizedBox(height: gap),
          Icon(
            icon,
            color: foregroundColor,
            size: iconSize,
          ),
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

  /// Triggered when a pointer has remained in contact with the screen at the
  /// same location for a long period of time.
  final VoidCallback? onLongPress;

  /// Triggered when a pointer that has triggered a long-press has
  /// stopped contacting the screen
  final VoidCallback? onLongPressUp;

  /// The widget which is inside the button.
  ///
  /// It could be any widget, for example [Text], [Icon], [Row]
  final Widget child;

  /// The color of the button.
  ///
  /// Defines the color of the button, applied to it's surface.
  /// If not specified, the default color ([0xFF2196F3]) will be used.
  final Color color;

  /// The border radius of the button.
  /// {@macro kTemplate}
  /// Determines the roundness of the corners of the button.
  /// If `null`, the default border radius ([8.0]) will be applied.
  final double? borderRadius;

  /// The horizontal padding inside the button.
  ///
  /// Defines the amount of horizontal padding between the content (like text or icon)
  /// and the edges of the button.
  /// If `null`, the default horizontal padding ([12.0]) will be applied.
  final double? horizontalPadding;

  /// The vertical padding inside the button.
  ///
  /// Defines the amount of vertical padding between the content  (like text or icon)
  /// and the edges of the button.
  /// If `null`, the default vertical padding ([8.0]) will be applied.
  final double? verticalPadding;

  /// The elevation of the button.
  ///
  /// Specifies the elevation of the button, making it appear raised above the surface.
  /// If not specified, the default elevation ([6.0]) for the button will be applied.
  final double elevation;

  /// The elevation of the button when pressed.
  ///
  /// Specifies the elevation of the button, making it appear raised above the surface.
  /// If not specified, the default pressed elevation ([2.0]) for the button will be applied.
  final double pressedElevation;

  /// The semantic label for the button that will be announced by screen readers.
  ///
  /// This is announced in accessibility modes (e.g TalkBack/VoiceOver).
  ///
  /// This label does not show in the UI.
  final String? semanticLabel;

  /// Whether to replace all child semantics with this node.
  /// Using [semanticLabel] is highly recommended when setting this value to `true`.
  ///
  /// Defaults to [false].
  final bool? excludeSemantics;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.onClick == null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onClick,
      onTapDown: isDisabled ? null : (_) => setState(() => isPressed = true),
      onTapUp: isDisabled
          ? null
          : (_) {
              setState(() => isPressed = true);
              Future.delayed(
                const Duration(milliseconds: 100),
                () => setState(() => isPressed = false),
              );
            },
      onTapCancel: isDisabled ? null : () => setState(() => isPressed = false),
      onLongPress: isDisabled ? null : widget.onLongPress,
      onLongPressUp: isDisabled ? null : widget.onLongPressUp,
      onLongPressStart:
          isDisabled ? null : (_) => setState(() => isPressed = true),
      onLongPressEnd:
          isDisabled ? null : (_) => setState(() => isPressed = false),
      child: Semantics(
        button: true,
        enabled: !isDisabled,
        label: widget.semanticLabel,
        excludeSemantics: widget.excludeSemantics ?? kExcludeSemantics,
        child: CustomPaint(
          painter: _ButtonPainter(
            borderRadius: widget.borderRadius ?? kBorderRadius,
            elevation: widget.elevation,
            pressedElevation: widget.pressedElevation,
            color: widget.color,
            isPressed: isPressed,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding ?? kHorizontalPadding,
                  vertical: widget.verticalPadding ?? kVerticalPadding,
                ) +
                EdgeInsets.only(
                  bottom:
                      isPressed ? widget.pressedElevation : widget.elevation,
                ) +
                EdgeInsets.only(
                  top: isPressed
                      ? widget.elevation - widget.pressedElevation
                      : 0,
                ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _ButtonPainter extends CustomPainter {
  _ButtonPainter({
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
    const shadowColor = kShadowColor;

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
  bool shouldRepaint(covariant _ButtonPainter oldDelegate) {
    return oldDelegate.isPressed != isPressed ||
        oldDelegate.color != color ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.elevation != elevation ||
        oldDelegate.pressedElevation != pressedElevation;
  }
}
