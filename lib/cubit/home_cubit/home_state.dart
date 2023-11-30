part of 'home_cubit.dart';

class HomeState extends Equatable {
const HomeState({
    required this.productList,
    this.isLoading,
    this.indexColorList,
    required this.hasFocusSearch,
    required this.categories,
   
    required this.selectedCategoryList,
    this.searchList,
  });
  final List<ProductModel?>? productList;
  final bool? isLoading;
  final List<String>? categories;
  final List<ProductModel?>? searchList;
  final List<ProductModel?>? selectedCategoryList;
  final bool? hasFocusSearch;

  final List<bool?>? indexColorList;

  @override
  List<Object?> get props => [
        productList,
        isLoading,
        categories,
        searchList,
        selectedCategoryList,
        hasFocusSearch,
        indexColorList,
     
      ];

  HomeState copyWith(
      {List<ProductModel?>? productList,
      bool? isLoading,
      List<String>? categories,
      bool? isSelected,
      List<bool?>? indexColorList,
      List<ProductModel?>? selectedCategoryList,
      List<ProductModel?>? searchList,
      bool? hasFocusSearch,
      }) {
    return HomeState(
        productList: productList ?? this.productList,
        isLoading: isLoading ?? this.isLoading,
        categories: categories ?? this.categories,
        searchList: searchList ?? this.searchList,
        selectedCategoryList: selectedCategoryList ?? this.selectedCategoryList,
        hasFocusSearch: hasFocusSearch ?? this.hasFocusSearch,
        indexColorList: indexColorList ?? this.indexColorList,
       
        );
  }
}
