import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sohbet/common_widget/social_log_in_button.dart';
import 'package:flutter_sohbet/viewmodel/user_model.dart';
import 'package:provider/provider.dart';
import 'email_sifre_giris_ve_kayit.dart';

class SignInPage extends StatelessWidget {
  void _signInWithGoogle(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    await _userModel.signInWithGoogle();
  }

  void _signInWithFacebook(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    await _userModel.signInWithFacebook();
  }

  void _misafirGirisi(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    await _userModel.signInAnonymously();
  }

  void _emailVeSifreGiris(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailveSifreLoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sohbet'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Oturum Acin',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              butonText: 'Gmail ile Giris Yap',
              butonColor: Colors.white,
              textColor: Colors.black87,
              onPressed: () => _signInWithGoogle(context),
            ),
            SocialLoginButton(
              butonText: 'Facebook ile Giris Yap',
              textColor: Colors.white,
              radius: 16,
              onPressed: () => _signInWithFacebook(context),
              butonColor: Color(0xFF334D92),
            ),
            SocialLoginButton(
              butonText: "Email ve Sifre ile Giris Yap",
              onPressed: () => _emailVeSifreGiris(context),
            ),
            SocialLoginButton(
              butonText: "Misafir giris",
              onPressed: () => _misafirGirisi(context),
            ),
          ],
        ),
      ),
    );
  }
}
