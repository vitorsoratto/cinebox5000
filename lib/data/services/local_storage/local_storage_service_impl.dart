import 'package:cinebox5000/core/result/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import './local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _flutterSecureStorage;

  LocalStorageServiceImpl({required FlutterSecureStorage flutterSecureStorage})
    : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<Result<Unit>> deleteData(String key) async {
    await _flutterSecureStorage.delete(key: key);

    return successOfUnit();
  }

  @override
  Future<Result<String?>> getData(String key) async {
    final value = await _flutterSecureStorage.read(key: key);

    if (value == null) {
      return Failure(Exception('No data found for key: $key'));
    }

    return Success(value);
  }

  @override
  Future<Result<Unit>> saveData(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);

    return successOfUnit();
  }
}
