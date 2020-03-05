import 'package:bnerd/authentication/authenticate.dart';
import 'package:bnerd/model/user.dart';
import 'package:bnerd/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    }else {
      return Home();
    }

  }
}