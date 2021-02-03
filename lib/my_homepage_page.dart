// import 'package:bloc_test_project/bloc/my_homepage_bloc.dart';
import 'package:bloc_test_project/bloc/my_homepage_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/my_homepage_bloc.dart';
import 'bloc/my_homepage_state.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final bloc = MyHomePageBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<MyHomePageBloc, MyHomePageState>(
                cubit: bloc,
                builder: (context, state) {
                  if (state is Success) {
                    return Text(
                      state.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  if (state is Idle) {
                    return Text(
                      state.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  if (state is Loading) {
                    return CircularProgressIndicator();
                  }
                  return Container();
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            bloc.add(IncrementEvent()), //aqui a ação de mudança do dado
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
