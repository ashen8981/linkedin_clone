import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

//curved button
class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color initialColor;
  final Size minimumSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    required this.initialColor,
    required this.minimumSize,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}


class _CustomButtonState extends State<CustomButton> {
  late bool _isPressed;
  late Color _buttonColor;

  @override
  void initState() {
    super.initState();
    _isPressed = false;
    _buttonColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = widget.width ?? widget.minimumSize.width;
    final double buttonHeight = widget.height ?? widget.minimumSize.height;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
            _buttonColor = _isPressed ? bCustomColor : wCustomColor;
          });
          widget.onPressed();
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(widget.minimumSize),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return _buttonColor;
          }),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 10)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            CustomMiddleCurveBorder(height: buttonHeight, radius: 16.0),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              color: _buttonColor == bCustomColor ? wCustomColor : bCustomColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
      ),
    );
  }
}

//curved button style
class CustomMiddleCurveBorder extends OutlinedBorder {
  final double height;
  final double radius;

  const CustomMiddleCurveBorder({required this.height, this.radius = 16.0});

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path();
    final double width = rect.width;
    final double topCurveHeight = height * 0.1;

    path.moveTo(radius, 0); // Start after the top-left radius
    path.quadraticBezierTo(width / 2, -topCurveHeight, width - radius, 0); // Top curve
    path.quadraticBezierTo(width, 0, width, radius); // Top-right corner
    path.lineTo(width, height - topCurveHeight - radius); // Right side down to before the bottom-right radius
    path.quadraticBezierTo(width, height - topCurveHeight, width - radius, height - topCurveHeight); // Bottom-right corner
    path.quadraticBezierTo(width / 2, height + topCurveHeight, radius, height - topCurveHeight); // Bottom curve
    path.quadraticBezierTo(0, height - topCurveHeight, 0, height - topCurveHeight - radius); // Bottom-left corner
    path.lineTo(0, radius); // Left side up to before the top-left radius
    path.quadraticBezierTo(0, 0, radius, 0); // Top-left corner

    path.close();
    return path;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return CustomMiddleCurveBorder(height: height, radius: radius);
  }
}


//Login SignUp button
class CurvedEdgeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final double borderWidth;
  final Color? color;

  const CurvedEdgeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: Padding(
        padding: padding,
        child: buildButtonText(),
      ),
    );
  }

  Widget buildButtonText() {
    return Text(
      text,
      style: textStyle?.merge(TextStyle(color: color, fontSize: 16)) ?? const TextStyle(color: wCustomColor, fontSize: 16),
    );
  }
}