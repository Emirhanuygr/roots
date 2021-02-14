import 'package:flutter/material.dart';
import 'package:flutter_sohbet/app/home_page.dart';
import 'file:///C:/Users/emirh/AndroidStudioProjects/flutter_sohbet/lib/app/sign_in/sign_in_page.dart';
import 'package:flutter_sohbet/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return SignInPage();
      } else {
        return HomePage(
            user: _userModel.user); // HomePage(user: _userModel.user);
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
