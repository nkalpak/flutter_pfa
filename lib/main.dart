import 'package:flutter/material.dart';
import 'package:product_feedback_app/design_system/colors.dart';

import 'material/app_bar.dart';

void main() {
  runApp(const MyApp());
}

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
      child: ListView(
        children: [ListTile(title: Text('Hello'))],
      ),
    );
  }
}
