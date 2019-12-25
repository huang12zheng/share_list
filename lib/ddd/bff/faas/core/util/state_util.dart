import '../abstract_state.dart';

abstract class ToStateable<T> {
  InState modelToState(T model );
}

abstract class ToListStateable<T> {
  InState modelToState(List<T> items);
}