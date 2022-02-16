import 'package:mobx/mobx.dart';

part 'product_feedback_store.g.dart';

class ProductFeedbackStore = _ProductFeedbackStore with _$ProductFeedbackStore;

const String allFilter = 'all';

var initialData = [
  ProductFeedback(
      id: 1,
      title: 'John',
      category: 'ui',
      status: 'planned',
      description: 'Hello'),
  ProductFeedback(
      id: 1,
      title: 'John',
      category: 'ui',
      status: 'live',
      description: 'Hello'),
  ProductFeedback(
      id: 1,
      title: 'John',
      category: 'enhancement',
      status: 'in-progress',
      description: 'Hello'),
  ProductFeedback(
      id: 1,
      title: 'John',
      category: 'bug',
      status: 'planned',
      description: 'Hello'),
  ProductFeedback(
      id: 1,
      title: 'John',
      category: 'feature',
      status: 'live',
      description: 'Hello'),
];

abstract class _ProductFeedbackStore with Store {
  @observable
  ObservableList<ProductFeedback> productFeedbackList =
      ObservableList.of(initialData);

  @observable
  ObservableList<String> categoryFilters = ObservableList.of([]);

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
  // The "all" filter is a special case filter which should toggle all
  // other filters, including itself.
  void toggleCategoryAllFilter() {
    if (categoryFilters.contains(allFilter)) {
      categoryFilters.removeWhere((_) => true);
    } else {
      categoryFilters = ObservableList.of(allCategories);
    }
  }

  @action
  void toggleCategoryFilter(String filter) {
    if (filter == allFilter) {
      return toggleCategoryAllFilter();
    }

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
        .where((pf) => categoryFilters.contains(pf.category)));
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
