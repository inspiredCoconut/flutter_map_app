import 'package:get_it/get_it.dart';

import '../../data/repositories/user_repository.dart';
import '../../data/repositories/auth_repository.dart';

import '../../presenters/auth_presenter.dart';

import '../di/database_helper.dart';
import 'auth_service.dart';


final GetIt locator = GetIt.instance;
final DatabaseHelper databaseHelper = DatabaseHelper.instance;

void setupLocator(){
    locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository(databaseHelper));
  locator.registerFactory(() => AuthPresenter(locator<AuthService>()));
}