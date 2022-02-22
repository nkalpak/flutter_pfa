import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../main.dart';

class ProductFeedbackStatusTile extends StatelessWidget {
  final String status;

  const ProductFeedbackStatusTile({Key? key, required this.status})
      : super(key: key);

  int getProductFeedbacksForStatus(String status) {
    return productFeedbackStore.productFeedbacksByStatus[status]?.length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListTile(
        dense: true,
        visualDensity: VisualDensity.comfortable,
        minLeadingWidth: 32,
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.all(0),
        leading: Icon(
          Icons.circle,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          size: 12,
        ),
        title: PfaTypography.body1(
          status.toCapitalized(),
          color: PfaColors.blueGreyLight,
        ),
        trailing: PfaTypography.heading4(
          '${getProductFeedbacksForStatus(status)}',
          color: PfaColors.blueGreyDark,
        ),
      ),
    );
  }
}
