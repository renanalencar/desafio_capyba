import 'package:desafio_capyba/repositories/auth_repo.dart';
import 'package:desafio_capyba/controllers/user_controller.dart';
import 'package:desafio_capyba/repositories/storage_repo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}
