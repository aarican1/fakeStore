

import 'package:fake_store/service/dio_manager.dart';
import 'package:fake_store/service/store_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final IStoreService service;
  setUp(() {
    service = StoreService(dioManager: DioManager.instance);
  });
  test('Categories Test', () async {
    final response = await service.categories();
    expect(response, isNotNull);
  });
}
