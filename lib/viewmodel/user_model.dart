import 'package:flutter/material.dart';
import 'package:flutter_sohbet/locator.dart';
import 'package:flutter_sohbet/model/user_model.dart';
import 'package:flutter_sohbet/repository/user_repository.dart';
import 'package:flutter_sohbet/services/main/auth_base.dart';

enum ViewState{Idle,Busy}

class UserModel with ChangeNotifier implements AuthBase{

  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  Uzer _user;


  Uzer get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel(){
    currentUser();
  }

  @override
  Future<Uzer> currentUser() async {
    try{
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata '+ e.toString());
      return null;
    }finally{ // try yada catch'den sonra mutlaka yap
      state = ViewState.Idle;
    }
  }

  @override
  Future<Uzer> signInAnonymously() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymously();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata '+ e.toString());
      return null;
    }finally{ // try yada catch'den sonra mutlaka yap
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try{
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata '+ e.toString());
      return false;
    }finally{ // try yada catch'den sonra mutlaka yap
      state = ViewState.Idle;
    }

  }

  @override
  Future<Uzer> signInWithGoogle() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata '+ e.toString());
      return null;
    }finally{ // try yada catch'den sonra mutlaka yap
      state = ViewState.Idle;
    }

  }

  @override
  Future<Uzer> signInWithFacebook() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInWithFacebook();
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata '+ e.toString());
      return null;
    }finally{ // try yada catch'den sonra mutlaka yap
      state = ViewState.Idle;
    }

  }

  @override
  Future<Uzer> createUserWithEmailandPassword(String email, String sifre) async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.createUserWithEmailandPassword(email, sifre);
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata '+ e.toString());
      return null;
    }finally{ // try yada catch'den sonra mutlaka yap
      state = ViewState.Idle;
    }
  }

  @override
  Future<Uzer> signInWithEmailandPassword(String email, String sifre) async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInWithEmailandPassword(email, sifre);
      return _user;
    }catch(e){
      debugPrint('Viewmodeldeki current user hata '+ e.toString());
      return null;
    }finally{ // try yada catch'den sonra mutlaka yap
      state = ViewState.Idle;
    }
  }

}