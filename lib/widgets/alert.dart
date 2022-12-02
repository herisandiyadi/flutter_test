import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class AlertWidget {
  void error(BuildContext context, String messages) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Failed',
      text: messages,
    );
  }
}
