// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_feedback_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductFeedbackStore on _ProductFeedbackStore, Store {
  Computed<ObservableList<ProductFeedback>>?
      _$productFeedbackListFilteredComputed;

  @override
  ObservableList<ProductFeedback> get productFeedbackListFiltered =>
      (_$productFeedbackListFilteredComputed ??=
              Computed<ObservableList<ProductFeedback>>(
                  () => super.productFeedbackListFiltered,
                  name: '_ProductFeedbackStore.productFeedbackListFiltered'))
          .value;
  Computed<ObservableMap<String, List<ProductFeedback>>>?
      _$productFeedbacksByStatusComputed;

  @override
  ObservableMap<String, List<ProductFeedback>> get productFeedbacksByStatus =>
      (_$productFeedbacksByStatusComputed ??=
              Computed<ObservableMap<String, List<ProductFeedback>>>(
                  () => super.productFeedbacksByStatus,
                  name: '_ProductFeedbackStore.productFeedbacksByStatus'))
          .value;

  final _$productFeedbackListAtom =
      Atom(name: '_ProductFeedbackStore.productFeedbackList');

  @override
  ObservableList<ProductFeedback> get productFeedbackList {
    _$productFeedbackListAtom.reportRead();
    return super.productFeedbackList;
  }

  @override
  set productFeedbackList(ObservableList<ProductFeedback> value) {
    _$productFeedbackListAtom.reportWrite(value, super.productFeedbackList, () {
      super.productFeedbackList = value;
    });
  }

  final _$categoryFiltersAtom =
      Atom(name: '_ProductFeedbackStore.categoryFilters');

  @override
  ObservableList<String> get categoryFilters {
    _$categoryFiltersAtom.reportRead();
    return super.categoryFilters;
  }

  @override
  set categoryFilters(ObservableList<String> value) {
    _$categoryFiltersAtom.reportWrite(value, super.categoryFilters, () {
      super.categoryFilters = value;
    });
  }

  final _$_ProductFeedbackStoreActionController =
      ActionController(name: '_ProductFeedbackStore');

  @override
  void addProductFeedback(ProductFeedback productFeedback) {
    final _$actionInfo = _$_ProductFeedbackStoreActionController.startAction(
        name: '_ProductFeedbackStore.addProductFeedback');
    try {
      return super.addProductFeedback(productFeedback);
    } finally {
      _$_ProductFeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editProductFeedback(int id, ProductFeedback editedProductFeedback) {
    final _$actionInfo = _$_ProductFeedbackStoreActionController.startAction(
        name: '_ProductFeedbackStore.editProductFeedback');
    try {
      return super.editProductFeedback(id, editedProductFeedback);
    } finally {
      _$_ProductFeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteProductFeedback(int id) {
    final _$actionInfo = _$_ProductFeedbackStoreActionController.startAction(
        name: '_ProductFeedbackStore.deleteProductFeedback');
    try {
      return super.deleteProductFeedback(id);
    } finally {
      _$_ProductFeedbackStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productFeedbackList: ${productFeedbackList},
categoryFilters: ${categoryFilters},
productFeedbackListFiltered: ${productFeedbackListFiltered},
productFeedbacksByStatus: ${productFeedbacksByStatus}
    ''';
  }
}
