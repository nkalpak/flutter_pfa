import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';
import '../widgets/product_feedback_card.dart';

class ProductFeedbackListPage extends StatelessWidget {
  const ProductFeedbackListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView(
        children: productFeedbackStore.productFeedbackListFiltered
            .map((pf) => ProductFeedbackCard(
                title: pf.title,
                description: pf.description,
                categoryLabel: pf.category.toCapitalized()))
            .toList(),
      ),
    );
  }
}
