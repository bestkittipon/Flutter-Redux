import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_work2/redux/app_state.dart';
import 'package:flutter_work2/redux/app_redcer.dart';
import 'package:flutter_work2/redux/counter/countr_actions.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(appReducer,
      initialState: AppState(count: 0) , middleware: []);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<AppState, int>(
                builder: (buildContext, count) {
                  return Text(
                    '$count',
                    style: Theme.of(context).textTheme.display1,
                  );
                },
                converter: (store) => store.state.count)
          ],
        ),
      ),
      floatingActionButton: StoreConnector<AppState , VoidCallback>(
          builder: (context, callback ) {
            return FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          },
          converter: (store) => () => store.dispatch(IncrementAction())) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
