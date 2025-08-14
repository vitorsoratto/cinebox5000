import 'package:cinebox5000/core/result/result.dart';

abstract interface class LocalStorageService {
  Future<Result<Unit>> saveData(String key, String value);
  Future<Result<String?>> getData(String key);
  Future<Result<Unit>> deleteData(String key);
}
