import 'package:fake_store/model/product/product_model.dart';
import 'package:fake_store/service/dio_manager.dart';
import 'package:fake_store/service/store_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IStoreService service;
  setUp(() {
    service = StoreService(dioManager: DioManager.instance);
  });
  

  List<ProductModel?> searchProductTitle(
      List<ProductModel?>? products, String searchString) {
    List<ProductModel?> matchingProductList = [];
    if (products != null) {
      for (ProductModel? product in products) {
        if (product != null) {
          for (String key in product.toJson().keys) {
            var value = product.toJson()[key];
            if (value is String &&
                value.toLowerCase().contains(searchString.toLowerCase())) {
              matchingProductList.add(product);
              
            }
           
          }
        }
      }
    }
    return matchingProductList;
  }

  test('searchList', () async {
    final response = await service.productList();

    //List matchingList = searchProduct('electronics', response);
    final results = searchProductTitle(response, 'electronics');
    expect(results, isNotEmpty);
  });
}
