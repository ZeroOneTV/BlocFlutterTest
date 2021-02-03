import 'package:bloc_test_project/bloc/my_homepage_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { //regra de negócio sai do msm arquivo de VIEW e vai para um isolado
  //instancia a regra de negócio antes do build da VIEW (caso precise instanciar antes da VIEW ser criada, usar ela dentro do @override InitState
  MyHomePageBloc bloc = MyHomePageBloc();

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
            StreamBuilder( //bloco que recebe a alteração do estado dos itens
              stream: bloc.output,//aqui fica o que será observado para alterar de acordo com o estado
              builder: (context, snapshot) {//aqui ele usa o contexto usado, recebe o dado alterado via snapshot
                return Text(
                  '$snapshot',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.incrementCounter, //aqui a ação de mudança do dado
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}