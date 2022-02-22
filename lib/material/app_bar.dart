import 'package:flutter/material.dart';

import '../design_system/colors.dart';
import '../design_system/typography.dart';

var pfaAppBar = AppBar(
  toolbarHeight: 72,
  flexibleSpace: Container(
    decoration: BoxDecoration(
        gradient: RadialGradient(
      radius: 3,
      focal: Alignment.topLeft,
      colors: [PfaColors.darkBlue, PfaColors.purple],
    )),
  ),
  title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    PfaTypography.heading3('Frontend Mentor'),
    PfaTypography.body3('Feedback Board', color: PfaColors.white.withAlpha(200))
  ]),
);
