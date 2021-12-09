import 'package:dialed_health/services/storage_service.dart';
import 'package:get_it/get_it.dart';

class AuthService {
  final _storageService = GetIt.I.get<StorageService>();

  Future<bool> isLoggedIn() async {
    return await _storageService.get('isUserLogged') as bool;
  }
}