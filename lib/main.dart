import 'package:flutter/material.dart';
import 'package:product_feedback_app/widgets/app_wrapper.dart';
import 'package:vrouter/vrouter.dart';

import 'features/pages/product_feedback_create.dart';
import 'features/pages/product_feedback_list.dart';
import 'features/stores/product_feedback_store.dart';

void main() {
  runApp(const MyAppWithRouter());
}

final ProductFeedbackStore productFeedbackStore = ProductFeedbackStore();

class MyAppWithRouter extends StatelessWidget {
  const MyAppWithRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      debugShowCheckedModeBanner: false,
      routes: [
        VNester(
            path: '/',
            widgetBuilder: (child) => AppWrapper(child: child),
            nestedRoutes: [
              VWidget(path: null, widget: const HomePage()),
              VNester(
                  widgetBuilder: (child) => child,
                  path: 'product-feedback',
                  nestedRoutes: [
                    VWidget(
                        path: null, widget: const ProductFeedbackListPage()),
                    VWidget(
                        path: 'create',
                        widget: const ProductFeedbackCreatePage())
                  ]),
            ]),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.vRouter.to('/product-feedback');
              },
              child: Text('Go to feedbacks')),
          ElevatedButton(
              onPressed: () {
                context.vRouter.to('/details');
              },
              child: Text('Go to details')),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.vRouter.to('/');
        },
        child: Text('Press me'),
      ),
    );
  }
}

extension StringExtension on String {
  String toCapitalized() {
    return [this[0].toUpperCase(), substring(1)].join('');
  }
}
