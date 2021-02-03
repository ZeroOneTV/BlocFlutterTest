import 'package:bloc/bloc.dart';
import 'my_homepage_event.dart';
import 'my_homepage_state.dart';

class MyHomePageBloc extends Bloc<MyHomePageEvent, MyHomePageState> {
  MyHomePageBloc() : super(Idle());
  int counter = 0;
  @override
  Stream<MyHomePageState> mapEventToState(MyHomePageEvent event) async* {
    // yield Loading();
    // await Future.delayed(Duration(seconds: 2));
    if (event is IncrementEvent) {
      yield Success(counter: ++counter);
    }
    if (event is DecrementEvent) {
      yield Success(counter: --counter);
    }
  }
}
