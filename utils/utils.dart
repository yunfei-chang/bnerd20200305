import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bnerd/utils/colors.dart';

enum kMoreOptionsKeys {
  clearAll,
}

Map<int, String> kMoreOptionsMap = {
  kMoreOptionsKeys.clearAll.index: 'Clear Done',
};

class Utils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  /*static String getPlatformSpecificUrl({String iOSUrl, String androidUrl}) {
    if (Platform.isIOS) {
      return iOSUrl;
    } else if (Platform.isAndroid) {
      return androidUrl;
    }
  }*/



  static void showCustomDialog(BuildContext context,
      {String title,
        String msg,
        String noBtnTitle: 'Close',
        Function onConfirm,
        String confirmBtnTitle: 'Yes'}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        if (onConfirm != null)
          RaisedButton(
            color: Color(TodosColor.kPrimaryColorCode),
            onPressed: () {
              onConfirm();
              Navigator.pop(context);
            },
            child: Text(
              confirmBtnTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        RaisedButton(
          color: Color(TodosColor.kSecondaryColorCode),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            noBtnTitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (x) => dialog);
  }
}