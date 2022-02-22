import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../../material/filter_chip.dart';

class ProductFeedbackCard extends StatelessWidget {
  final String title, description, categoryLabel;

  const ProductFeedbackCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.categoryLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PfaTypography.heading4(title, color: PfaColors.blueGreyDark),
            const SizedBox(height: 8),
            PfaTypography.body2(description, color: PfaColors.blueGreyLight),
            const SizedBox(height: 8),
            PfaFilterChip(
                label: Text(categoryLabel), selected: false, onSelected: (_) {})
          ],
        ),
      ),
    );
  }
}
