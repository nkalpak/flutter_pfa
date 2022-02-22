import 'package:flutter/material.dart';

const h1Style =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: -0.33);

const h2Style =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: -0.25);

const h3Style =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: -0.25);

const h4Style =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: -0.2);

const body1Style = TextStyle(
  fontSize: 16,
);

const body2Style = TextStyle(
  fontSize: 15,
);

const body3Style = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 13,
);

class PfaTypography extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;

  const PfaTypography.heading1(this.text, {this.color})
      : style = h1Style;

  const PfaTypography.heading2(this.text, {this.color})
      : style = h2Style;

  const PfaTypography.heading3(this.text, {this.color})
      : style = h3Style;

  const PfaTypography.heading4(this.text, {this.color})
      : style = h4Style;

  const PfaTypography.body1(this.text, {this.color})
      : style = body1Style;

  const PfaTypography.body2(this.text, {this.color})
      : style = body2Style;

  const PfaTypography.body3(this.text, {this.color})
      : style = body3Style;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style.copyWith(color: color));
  }
}
