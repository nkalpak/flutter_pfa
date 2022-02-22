import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:product_feedback_app/features/widgets/product_feedback_filter_chip.dart';
import 'package:product_feedback_app/features/widgets/product_feedback_status_tile.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../main.dart';

class ProductFeedbackFilterDrawer extends StatelessWidget {
  const ProductFeedbackFilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PfaColors.desaturatedGrey,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: PfaColors.white,
              child: Observer(
                  builder: (_) => Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: productFeedbackStore.allCategories
                            .map((category) =>
                                ProductFeedbackFilterChip(filter: category))
                            .toList(),
                      )),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: PfaColors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      PfaTypography.heading2('Roadmap',
                          color: PfaColors.blueGreyDark),
                      const Spacer(),
                      PfaTypography.heading4(
                        'View',
                        color: PfaColors.darkBlue,
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: const [
                      ProductFeedbackStatusTile(status: 'planned'),
                      ProductFeedbackStatusTile(status: 'in-progress'),
                      ProductFeedbackStatusTile(status: 'live'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
