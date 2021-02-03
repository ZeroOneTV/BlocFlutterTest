import 'dart:async';

class MyHomePageBloc{
  int counter = 0;

  //controller de entrada e saída de dados.
  // ignore: close_sinks
  final StreamController _streamController = StreamController();
  //entrada do dado
  Sink get input => _streamController.sink;
  //saída de dado
  Stream get output => _streamController.stream;

  void incrementCounter() {
    counter++;
    input.add(counter);
  }

}