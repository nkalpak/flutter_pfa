import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/typography.dart';
import '../widgets/product_feedback_create_form.dart';

class ProductFeedbackCreatePage extends StatelessWidget {
  const ProductFeedbackCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        child: DefaultTextStyle.merge(
            style: TextStyle(color: PfaColors.blueGreyDark),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PfaTypography.heading2('Create New Feedback'),
                    SizedBox(
                      height: 24,
                    ),
                    ProductFeedbackCreateForm()
                  ],
                ),
              ),
            )));
  }
}
