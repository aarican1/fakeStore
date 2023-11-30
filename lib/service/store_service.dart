import 'dart:io';

import 'package:dio/dio.dart';

import 'package:fake_store/model/product/product_model.dart';
import 'package:fake_store/model/product/user/user_model.dart';
import 'package:fake_store/service/dio_manager.dart';

abstract class IStoreService {
  IStoreService({required this.dioManager});
  final DioManager dioManager;
  Future<List<ProductModel?>?> productList();
  Future<ProductModel?> product(int id);
  Future<List<ProductModel?>?> productLimit(int limitCount);
  Future<List<String>?> categories();
  Future<List<UserModel?>?> user();
}

class StoreService extends IStoreService {
  StoreService({required super.dioManager});
  String? errorMessage;

  @override
  Future<List<ProductModel?>?> productList() async {
    const String productPath = '/products';
    List<ProductModel?>? productList = [];
    try {
      final response = await dioManager.service.get(productPath);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;

        for (var product in jsonBody) {
          productList.add(ProductModel.fromJson(product));
        }
        return productList;
      }
    } on DioException catch (e) {
      errorMessage = ManagerException.fromError(e).toString();
    }
    return null;
  }

  @override
  Future<List<UserModel?>?> user() async {
    const String userPath = '/users';
    List<UserModel?>? userList = [];
    try {
      final response = await dioManager.service.get(userPath);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        for (var user in jsonBody) {
          userList.add(UserModel.fromJson(user));
        }
        return userList;
      }
    } on DioException catch (e) {
      errorMessage = ManagerException.fromError(e).toString();
    }
    return null;
  }

  @override
  Future<ProductModel?> product(int id) async {
    String productPath = '/products/$id';

    try {
      final response = await dioManager.service.get(productPath);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return ProductModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (e) {
      errorMessage = ManagerException.fromError(e).toString();
    }
    return null;
  }

  @override
  Future<List<String>?> categories() async {
    String categoriesPath = '/products/categories';

    try {
      final response = await dioManager.service.get(categoriesPath);
      if (response.statusCode == HttpStatus.ok) {
        if (response.data is List<dynamic>) {
          List<String> categories = [];
          for (var category in response.data) {
            if (category is String) {
              categories.add(category);
            }
          }
          return categories;
        }
      }
    } on DioException catch (e) {
      errorMessage = ManagerException.fromError(e).toString();
    }

    return null;
  }

  @override
  Future<List<ProductModel?>?> productLimit(int limitCount) async {
    String productPath = '/products?limit=$limitCount';
    List<ProductModel?>? productLimitList = [];
    try {
      final response = await dioManager.service.get(productPath);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;

        for (var product in jsonBody) {
          productLimitList.add(ProductModel.fromJson(product));
        }
        return productLimitList;
      }
    } on DioException catch (e) {
      errorMessage = ManagerException.fromError(e).toString();
    }
    return null;
  }
}
