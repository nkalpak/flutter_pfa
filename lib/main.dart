import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:product_feedback_app/design_system/colors.dart';
import 'package:product_feedback_app/design_system/typography.dart';
import 'package:product_feedback_app/material/filter_chip.dart';
import 'package:product_feedback_app/stores/product_feedback_store.dart';

import 'material/app_bar.dart';

void main() {
  runApp(const MyApp());
}

final ProductFeedbackStore productFeedbackStore = ProductFeedbackStore();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Jost'),
        title: 'Product Feedback App',
        home: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: pfaAppBar,
            endDrawer: ProductFeedbackFilterDrawer(),
          ),
        ));
  }
}

class ProductFeedbackFilterDrawer extends StatelessWidget {
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
                    children: [
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
  String status;

  ProductFeedbackStatusTile({Key? key, required this.status}) : super(key: key);

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
  String filter;

  ProductFeedbackFilterChip({Key? key, required this.filter}) : super(key: key);

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

extension StringExtension on String {
  String toCapitalized() {
    return [this[0].toUpperCase(), substring(1)].join('');
  }
}
