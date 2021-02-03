import 'package:flutter/material.dart';

abstract class MyHomePageState {}

class Loading extends MyHomePageState {}

class Error extends MyHomePageState {
  Error({
    this.message,
  });
  final String message;
}

class Success extends MyHomePageState {
  Success({
    @required this.counter,
  });
  final int counter;
}

class Idle extends MyHomePageState {
  Idle({
    this.counter = 0,
  });
    final int counter;

}
