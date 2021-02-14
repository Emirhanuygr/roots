import 'package:flutter_sohbet/locator.dart';
import 'package:flutter_sohbet/model/user_model.dart';
import 'package:flutter_sohbet/services/fake_auth_service.dart';
import 'package:flutter_sohbet/services/firebase_auth_service.dart';
import 'package:flutter_sohbet/services/main/auth_base.dart';

enum AppMode{DEBUG,RELEASE}


class UserRepository implements AuthBase {

  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService = locator<FakeAuthenticationService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<Uzer> currentUser() async {
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.currentUser();
    }else{
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<Uzer> signInAnonymously() async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signInAnonymously();
    }else{
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signOut();
    }else{
      return await _firebaseAuthService.signOut();
    }

  }

  @override
  Future<Uzer> signInWithGoogle() async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signInWithGoogle();
    }else{
      return await _firebaseAuthService.signInWithGoogle();
    }
  }

  @override
  Future<Uzer> signInWithFacebook() async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signInWithFacebook();
    }else{
      return await _firebaseAuthService.signInWithFacebook();
    }

  }

  @override
  Future<Uzer> createUserWithEmailandPassword(String email, String sifre) async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.createUserWithEmailandPassword(email, sifre);
    }else{
      return await _firebaseAuthService.createUserWithEmailandPassword(email, sifre);
    }
  }

  @override
  Future<Uzer> signInWithEmailandPassword(String email, String sifre) async{
    if(appMode == AppMode.DEBUG){
      return await _fakeAuthenticationService.signInWithEmailandPassword(email, sifre);
    }else{
      return await _firebaseAuthService.signInWithEmailandPassword(email, sifre);
    }
  }



}