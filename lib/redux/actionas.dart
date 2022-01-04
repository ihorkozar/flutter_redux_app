import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AddAction {}

class SetTextAction {
  final String text;

  SetTextAction({required this.text});
}

class ResetAction {}

class RemoveAction {}

class GetImgAction {}

class LoadedImgAction {
  final Widget widget;

  LoadedImgAction(this.widget);
}

ThunkAction loadImgThunkAction = (Store store) async {
  store.dispatch(GetImgAction());
  loadImg('https://infocity.az/wp-content/uploads/2013/10/Flutter-logo.jpg')
      .then((img) => store.dispatch(LoadedImgAction(img)));
};

Future<Widget> loadImg(String url) async {
  await Future.delayed(const Duration(seconds: 3));
  return Image.network(url);
}
