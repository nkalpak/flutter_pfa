import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../features/widgets/product_feedback_filter_drawer.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Jost'),
        title: 'Product Feedback App',
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(onPressed: () {
                if (context.vRouter.historyCanBack()) {
                  context.vRouter.historyBack();
                }
              }),
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
            body: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 38, horizontal: 24),
                color: PfaColors.desaturatedGrey,
                child: child),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(
                height: 50,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.vRouter.to('/product-feedback/create');
              },
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        ));
  }
}
