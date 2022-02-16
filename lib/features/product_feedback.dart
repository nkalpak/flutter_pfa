import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../main.dart';
import '../material/filter_chip.dart';

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

class ProductFeedbackFilterChip extends StatelessWidget {
  final String filter;

  const ProductFeedbackFilterChip({Key? key, required this.filter})
      : super(key: key);

  bool getIsSelected() {
    return productFeedbackStore.categoryFilters.contains(filter);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => PfaFilterChip(
          onSelected: (_) {
            productFeedbackStore.toggleCategoryFilter(filter);
          },
          label: Text(filter.toCapitalized()),
          selected: getIsSelected()),
    );
  }
}

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
