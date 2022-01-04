import 'package:flutter/cupertino.dart';
import 'package:flutter_redux_app/redux/actionas.dart';
import 'package:flutter_redux_app/redux/app_state.dart';
import 'package:redux/redux.dart';

void loaderMiddleWar(
  Store<AppState> store,
  dynamic action,
  NextDispatcher nextDispatcher,
) {
  if(action is GetImgAction){
    loadImg('https://infocity.az/wp-content/uploads/2013/10/Flutter-logo.jpg').then((img) => store.dispatch(LoadedImgAction(img)));
  }
  nextDispatcher(action);
}

Future<Widget> loadImg(String url) async{
  await Future.delayed(const Duration(seconds: 3));
  return Image.network(url);
}
