import 'package:get_it/get_it.dart';

import '../../data/repositories/user_repository.dart';
import '../../data/repositories/auth_repository.dart';

import '../../presenters/home_presenter.dart';
import '../../presenters/auth_presenter.dart';

import 'auth_service.dart';


final GetIt locator = GetIt.instance;

void setupLocator(){
    locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
  locator.registerFactory(() => HomePresenter(locator<AuthService>()));
  locator.registerFactory(() => AuthPresenter(locator<AuthService>()));
}