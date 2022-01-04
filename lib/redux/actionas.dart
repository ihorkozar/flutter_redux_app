import 'package:flutter/cupertino.dart';

class AddAction {}

class SetTextAction {
  final String text;

  SetTextAction({required this.text});
}

class ResetAction{}

class RemoveAction{}

class GetImgAction{}

class LoadedImgAction{
  final Widget widget;

  LoadedImgAction(this.widget);
}
