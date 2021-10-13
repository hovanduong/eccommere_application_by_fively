import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetGradientText extends StatelessWidget {
  WidgetGradientText(
    this.text, {
    this.style,
    this.gradient,
  });

  final String text;
  final TextStyle? style;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => (gradient ??
              LinearGradient(colors: [PRIMARY_COLOR_LIGHT, PRIMARY_COLOR_DARK]))
          .createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style ?? STYLE_MEDIUM,
      ),
    );
  }
}
