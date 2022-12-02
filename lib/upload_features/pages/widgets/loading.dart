import 'package:flutter/cupertino.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LoadingWidget {
  Future<dynamic> alert(BuildContext context) {
    return QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Loading',
      text: 'On Progress...',
    );
  }

  void loading(bool isOn, BuildContext context) {
    if (isOn) {
      alert(context);
    } else {
      Navigator.pop(context, false);
    }
  }
}
