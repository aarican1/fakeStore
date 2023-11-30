import 'package:equatable/equatable.dart';
import 'package:fake_store/model/product/product_model.dart';
import 'package:fake_store/service/store_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.storeService)
      : super(const HomeState(
          productList: [],
          categories: [],
          selectedCategoryList: [],
          indexColorList: [],
          hasFocusSearch: false,
        )) {
    Future.microtask(() => fetchAlltItems());
  }
  final IStoreService storeService;

  Future<void> fetchAlltItems() async {
    _changeLoading();
    final response = await storeService.productList();
    final categoriesResponse = await storeService.categories();

    emit(state.copyWith(
        categories: categoriesResponse ?? [], productList: response ?? []));
    if (state.selectedCategoryList == null ||
        state.selectedCategoryList!.isEmpty) {
      selectedCategory('electronics');
    }
    chooseColorList(state.categories?.length,0);
    _changeLoading();
  }

  void _changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }

  void searchHasFocus(bool hasFocus) {
    emit(state.copyWith(hasFocusSearch: hasFocus));
  }

  void selectedCategory(String categoryData) {
    emit(state.copyWith(
        selectedCategoryList: state.productList
            ?.where((element) => element?.category == categoryData)
            .toList()));
  }

  void chooseColorList(int? lenght, int index) {
    List<bool> tempList = [];
    if (lenght != null) {
      for (int i = 0; i < lenght; i++) {
      
          tempList.add(false);
         }
      if (index < lenght) tempList[index] = true;
      emit(state.copyWith(
          indexColorList: tempList,));
    }
  }

  void searchProductTitle(String searchString) {
    List<ProductModel?> matchingProductList = [];

    if (state.productList != null) {
      for (ProductModel? product in state.productList!) {
        if (product != null) {
          for (String key in product.toJson().keys) {
            var value = product.toJson()[key];
            if (value is String &&
                value.toLowerCase().contains(searchString.toLowerCase())) {
              /*Here, because it searches for searchString in each key of the map, 
                  it can add it to the list multiple times.
                   I didn't add some conditions because it's dummy.*/
              matchingProductList.add(product);
            }
          }
        }
      }
      emit(state.copyWith(searchList: matchingProductList));
    }
  }
}
