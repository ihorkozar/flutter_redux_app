import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/counter.dart';
import 'package:flutter_redux_app/redux/app_state.dart';
import 'package:flutter_redux_app/redux/middlewares.dart';
import 'package:flutter_redux_app/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<AppState> store = Store(reducer,
      initialState: AppState(
        counter: 0,
        text: 'init',
        widget: const Icon(Icons.image),
      ),
    middleware: [loaderMiddleWar],
  );

  runApp(StoreProvider(
    store: store,
    child: const MaterialApp(
      home: Counter(),
    ),
  ));
}
