import 'package:mobx/mobx.dart';

part 'product_feedback_store.g.dart';

class ProductFeedbackStore = _ProductFeedbackStore with _$ProductFeedbackStore;

abstract class _ProductFeedbackStore with Store {
  @observable
  ObservableList<ProductFeedback> productFeedbackList = ObservableList.of([]);

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

  @computed
  ObservableList<ProductFeedback> get productFeedbackListFiltered {
    return ObservableList.of(
        productFeedbackList.where((pf) => categoryFilters.contains(pf.status)));
  }

  @computed
  ObservableMap<String, List<ProductFeedback>> get productFeedbacksByStatus {
    var map = <String, List<ProductFeedback>>{};

    for (var pf in productFeedbackList) {
      var categoryList = map[pf.category];

      if (categoryList != null) {
        categoryList.add(pf);
      } else {
        map[pf.category] = [pf];
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
