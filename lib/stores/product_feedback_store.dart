import 'package:mobx/mobx.dart';

part 'product_feedback_store.g.dart';

class ProductFeedbackStore = _ProductFeedbackStore with _$ProductFeedbackStore;

const String allFilter = 'all';

var initialData = [
  ProductFeedback(
      id: 1,
      title: 'Add tags for solutions',
      category: 'ui',
      status: 'planned',
      description: 'Easier to search for solutions based on a specific stack.'),
  ProductFeedback(
      id: 1,
      title: 'Add a dark theme option',
      category: 'ui',
      status: 'live',
      description: 'It would help people with light sensitivities and who prefer dark mode.'),
  ProductFeedback(
      id: 1,
      title: 'Q&A within the challenge hubs',
      category: 'enhancement',
      status: 'in-progress',
      description: 'Challenge-specific Q&A would make for easy reference.'),
  ProductFeedback(
      id: 1,
      title: 'Allow image/video upload ',
      category: 'bug',
      status: 'planned',
      description: 'Images and screencasts can enhance comments on solutions.'),
  ProductFeedback(
      id: 1,
      title: 'Ability to follow others',
      category: 'feature',
      status: 'live',
      description: 'Stay updated on comments and solutions other people post.'),
];

abstract class _ProductFeedbackStore with Store {
  @observable
  ObservableList<ProductFeedback> productFeedbackList =
      ObservableList.of(initialData);

  @observable
  ObservableList<String> categoryFilters = ObservableList.of([allFilter]);

  @action
  void addProductFeedback(ProductFeedback productFeedback) {
    productFeedbackList.add(productFeedback);
  }

  @action
  void editProductFeedback(int id, ProductFeedback editedProductFeedback) {
    productFeedbackList = ObservableList.of(productFeedbackList
        .map((pf) => pf.id == id ? editedProductFeedback : pf));
  }

  @action
  void deleteProductFeedback(int id) {
    productFeedbackList.removeWhere((element) => element.id == id);
  }

  @action
  void toggleCategoryFilter(String filter) {
    if (categoryFilters.contains(filter)) {
      categoryFilters.removeWhere((cf) => cf == filter);
    } else {
      categoryFilters.add(filter);
    }
  }

  @computed
  ObservableList<String> get allCategories {
    return ObservableList.of(
        {allFilter, ...productFeedbackList.map((pf) => pf.category)});
  }

  @computed
  ObservableList<ProductFeedback> get productFeedbackListFiltered {
    return ObservableList.of(productFeedbackList
        .where((pf) {
          if (categoryFilters.contains(allFilter)) {
            return true;
          }

          return categoryFilters.contains(pf.category);
        }));
  }

  @computed
  ObservableMap<String, List<ProductFeedback>> get productFeedbacksByStatus {
    var map = <String, List<ProductFeedback>>{};

    for (var pf in productFeedbackList) {
      var statusList = map[pf.status];

      if (statusList != null) {
        statusList.add(pf);
      } else {
        map[pf.status] = [pf];
      }
    }

    return ObservableMap.of(map);
  }
}

class ProductFeedback {
  final int id;
  String title;
  String category;
  String status;
  String description;

  ProductFeedback(
      {required this.id,
      required this.title,
      required this.category,
      required this.status,
      required this.description});
}
