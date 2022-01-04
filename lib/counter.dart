import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/redux/actionas.dart';
import 'package:flutter_redux_app/redux/app_state.dart';
import 'package:redux/redux.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of(context);
    String inputText = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.all(16),
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, state) => state.widget,
              ),
            ),
            ElevatedButton(
              onPressed: () => store.dispatch(loadImgThunkAction(store)),
              child: const Text('Get Image'),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (value) => inputText = value,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () =>
                          store.dispatch(SetTextAction(text: inputText)),
                      child: const Text('SET')),
                ),
                const SizedBox(
                  width: 32,
                ),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () => store.dispatch(ResetAction()),
                      child: const Text('RESET')),
                ),
              ],
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(state.text),
            ),
            const SizedBox(
              height: 16,
            ),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 35),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => store.dispatch(AddAction()),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 32,
                ),
                FloatingActionButton(
                  onPressed: () => store.dispatch(RemoveAction()),
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
