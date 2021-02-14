import 'package:flutter/material.dart';
import 'package:flutter_sohbet/viewmodel/user_model.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';


class HomePage extends StatelessWidget {

  final Uzer user;


  HomePage({Key key,@required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed:()=> _cikisYap(context),
            child: Text(
              'Exit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text('Ana Sayfa'),
      ),
      body: Center(
        child: Text('Hosgeldiniz ${user.userID}'),
      ),
    );
  }

  Future<bool> _cikisYap(BuildContext context) async{
    final _userModel = Provider.of<UserModel>(context,listen: false);
    bool sonuc = await _userModel.signOut();
    return sonuc;

  }
}












