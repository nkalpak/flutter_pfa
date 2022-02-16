import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:product_feedback_app/design_system/colors.dart';
import 'package:product_feedback_app/stores/product_feedback_store.dart';

import 'design_system/typography.dart';
import 'features/product_feedback.dart';

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
            appBar: AppBar(
              toolbarHeight: 72,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  radius: 3,
                  focal: Alignment.topLeft,
                  colors: [PfaColors.darkBlue, PfaColors.purple],
                )),
              ),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PfaTypography.heading3('Frontend Mentor'),
                    PfaTypography.body3('Feedback Board',
                        color: PfaColors.white.withAlpha(200))
                  ]),
            ),
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
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(
                height: 50,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        ));
  }
}

extension StringExtension on String {
  String toCapitalized() {
    return [this[0].toUpperCase(), substring(1)].join('');
  }
}
