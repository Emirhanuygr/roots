import 'package:flutter_sohbet/model/user_model.dart';
import 'file:///C:/Users/emirh/AndroidStudioProjects/flutter_sohbet/lib/services/main/auth_base.dart';

class FakeAuthenticationService implements AuthBase{

  String userID = '21312131';


  @override
  Future<Uzer> currentUser() async {
    return await Future.value(Uzer(userID: userID));
  }

  @override
  Future<Uzer> signInAnonymously() async {
    return await Future.delayed(Duration(seconds: 2),()=>Uzer(userID: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<Uzer> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Uzer> signInWithFacebook() {

  }

  @override
  Future<Uzer> createUserWithEmailandPassword(String email, String sifre) {
    // TODO: implement createUserWithEmailandPassword
    throw UnimplementedError();
  }

  @override
  Future<Uzer> signInWithEmailandPassword(String email, String sifre) {
    // TODO: implement signInWithEmailandPassword
    throw UnimplementedError();
  }

}













