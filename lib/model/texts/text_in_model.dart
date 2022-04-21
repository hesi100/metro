import 'package:flutter/cupertino.dart';

class TextInModel {
  TextEditingController textController = TextEditingController();

  FocusNode focus = FocusNode();

  String error = '';

  bool hasNotError() {
    return error == '';
  }

  void clearError() {
    error = '';
  }

  void dispose() {
    textController.dispose();
    focus.dispose();
  }
}
