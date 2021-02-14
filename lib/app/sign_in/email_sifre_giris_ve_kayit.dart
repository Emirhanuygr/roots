import 'package:flutter/material.dart';
import 'package:flutter_sohbet/app/home_page.dart';
import 'package:flutter_sohbet/common_widget/social_log_in_button.dart';
import 'package:flutter_sohbet/model/user_model.dart';
import 'package:flutter_sohbet/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

enum FormType { Register, LogIn }

class EmailveSifreLoginPage extends StatefulWidget {
  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String _email, _sifre;
  String _butonText, _linkText;
  var _formType = FormType.LogIn;
  final _formKey = GlobalKey<FormState>();

  void _formSubmit() async{
    _formKey.currentState.save();
    debugPrint('Email:' + _email + 'sifre:' + _sifre);
    final _userModel = Provider.of<UserModel>(context,listen: false);

    if(_formType == FormType.LogIn){
      await _userModel.signInWithEmailandPassword(_email, _sifre);
    }else{
      await _userModel.createUserWithEmailandPassword(_email, _sifre);
    }
  }

  void _degistir() {
    setState(() {
      _formType = _formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    _butonText = _formType == FormType.LogIn ? "Giris Yap" : "Kayit Ol";
    _linkText = _formType == FormType.LogIn
        ? "Hesabiniz Yokmu? Kayit Olun"
        : "Hesabiniz Varmi? Giris Yapin";

    final _userModel = Provider.of<UserModel>(context);

   /* if (_userModel.state == ViewState.Idle) {
      if (_userModel.user != null) {
        return HomePage(user: _userModel.user,);
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  */
    if(_userModel.user != null){

    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Giris / Kayit'),
      ),
      body: _userModel.state == ViewState.Idle ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (String girilenEmail) {
                    _email = girilenEmail;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  obscureText: true, // password
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Sifre',
                    labelText: 'Sifre',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (String girilenSifre) {
                    _sifre = girilenSifre;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                SocialLoginButton(
                  butonText: _butonText,
                  butonColor: Colors.purple,
                  onPressed: () => _formSubmit(),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () => _degistir(),
                  child: Text(_linkText),
                ),
              ],
            ),
          ),
        ),
      ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
