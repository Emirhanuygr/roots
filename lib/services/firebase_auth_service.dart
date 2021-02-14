import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_sohbet/model/user_model.dart';
import 'file:///C:/Users/emirh/AndroidStudioProjects/flutter_sohbet/lib/services/main/auth_base.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Uzer> currentUser() async {
    try {
      User user = await _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Uzer _userFromFirebase(User user) {
    // Translate user from firebaseuser
    if (user == null) return null;
    return Uzer(userID: user.uid);
  }

  @override
  Future<Uzer> signInAnonymously() async {
    try {
      // AuthResult = UserCredential
      UserCredential sonuc = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(sonuc.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final _googleSignIn = GoogleSignIn();
      final _facebookLogin = FacebookLogin();
      await _googleSignIn.signOut();
      await _facebookLogin.logOut();
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print('Sign out hatasi' + e.toString());
      return false;
    }
  }

  @override
  Future<Uzer> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential sonuc = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        User _user = sonuc.user;
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<Uzer> signInWithFacebook() async {
    final _facebookLogin = FacebookLogin();
    FacebookLoginResult _faceResult =
        await _facebookLogin.logIn(['public_profile', 'email']);
    switch (_faceResult.status) {
      case FacebookLoginStatus.loggedIn:
        if (_faceResult.accessToken != null) {
          UserCredential _firebaseResult = await _firebaseAuth.signInWithCredential(
              FacebookAuthProvider.credential(_faceResult.accessToken.token));
          User _user = _firebaseResult.user;
          return _userFromFirebase(_user);
        }

        break;

      case FacebookLoginStatus.cancelledByUser:
        print('Kullanici Facebook Girisi Iptal etti');
        break;
      case FacebookLoginStatus.error:
        print('Hata Cikti' + _faceResult.errorMessage);
        break;
    }
    return null;
  }

  @override
  Future<Uzer> createUserWithEmailandPassword(String email, String sifre) async{
    try {
      // AuthResult = UserCredential
      UserCredential sonuc = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: sifre);
      return _userFromFirebase(sonuc.user);
    } catch (e) {
      print(e);
      return null;
    }

  }

  @override
  Future<Uzer> signInWithEmailandPassword(String email, String sifre) async{
    try {
      // AuthResult = UserCredential
      UserCredential sonuc = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: sifre);
      return _userFromFirebase(sonuc.user);
    } catch (e) {
      print(e);
      return null;
    }

  }
}
