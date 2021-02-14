import 'package:flutter_sohbet/model/user_model.dart';

abstract class AuthBase{
  Future<Uzer> currentUser();
  Future<Uzer> signInAnonymously();
  Future<bool> signOut();
  Future<Uzer> signInWithGoogle();
  Future<Uzer> signInWithFacebook();
  Future<Uzer> signInWithEmailandPassword(String email,String sifre);
  Future<Uzer> createUserWithEmailandPassword(String email,String sifre);
}