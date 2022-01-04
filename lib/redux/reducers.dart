import 'package:flutter_redux_app/redux/app_state.dart';
import 'actionas.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    counter: _counterReducer(state, action), text: _textReducer(state, action));

int _counterReducer(AppState state, dynamic action) {
  if (action is AddAction) {
    return state.counter + 1;
  } else if (action is RemoveAction) {
    return state.counter - 1;
  } else {
    return state.counter;
  }
}

String _textReducer(AppState state, dynamic action) {
  if (action is SetTextAction) {
    return action.text;
  } else if (action is ResetAction) {
    return '';
  } else {
    return state.text;
  }
}
