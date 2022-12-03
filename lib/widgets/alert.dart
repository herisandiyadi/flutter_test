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

  void success(BuildContext context, String messages) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Success',
      text: messages,
    );
  }

  void customAlert(BuildContext context, String messages, String images) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Success',
      text: messages,
      customAsset: images,
    );
  }
}
