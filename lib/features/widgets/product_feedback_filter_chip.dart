import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';
import '../../material/filter_chip.dart';

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
