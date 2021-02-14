import 'package:flutter_sohbet/repository/user_repository.dart';
import 'package:flutter_sohbet/services/fake_auth_service.dart';
import 'package:flutter_sohbet/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator(){

  locator.registerLazySingleton(()=>FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => UserRepository());

}




