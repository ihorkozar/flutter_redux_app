import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'actionas.dart';
import 'app_state.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    counter: _counterReducer(state.counter, action),
    text: _textReducer(state.text, action), 
    widget: _imgReducer(state.widget, action));

Reducer<int> _counterReducer = combineReducers([
  TypedReducer<int, AddAction>(_addCounterReducer),
  TypedReducer<int, RemoveAction>(_removeCounterReducer),
]);

Reducer<String> _textReducer = combineReducers([
  TypedReducer<String, SetTextAction>(_setTextReducer),
  TypedReducer<String, ResetAction>(_resetTextReducer),
]);

Reducer<Widget> _imgReducer = combineReducers([
  TypedReducer<Widget, GetImgAction>(_getImgReducer),
  TypedReducer<Widget, LoadedImgAction>(_loadedImgReducer),
]);

String _setTextReducer(String text, SetTextAction action) => action.text;
String _resetTextReducer(String text, ResetAction action) => '';

int _addCounterReducer(int count, AddAction action) => count + 1;
int _removeCounterReducer(int count, RemoveAction action) => count - 1;

Widget _getImgReducer(Widget widget, GetImgAction action) =>
    const Center(child: CircularProgressIndicator());
Widget _loadedImgReducer(Widget widget, LoadedImgAction action) => action.widget;