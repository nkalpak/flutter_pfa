import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:product_feedback_app/design_system/colors.dart';
import 'package:product_feedback_app/stores/product_feedback_store.dart';

import 'features/product_feedback.dart';
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
            endDrawer: const ProductFeedbackFilterDrawer(),
            backgroundColor: PfaColors.neutralGrey,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Observer(
                builder: (_) => ListView(
                  children: productFeedbackStore.productFeedbackListFiltered
                      .map((pf) => ProductFeedbackCard(
                          title: pf.title,
                          description: pf.description,
                          categoryLabel: pf.category.toCapitalized()))
                      .toList(),
                ),
              ),
            ),
          ),
        ));
  }
}

extension StringExtension on String {
  String toCapitalized() {
    return [this[0].toUpperCase(), substring(1)].join('');
  }
}
