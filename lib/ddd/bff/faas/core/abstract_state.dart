
import 'index.dart';

abstract class StateBase extends Equatable {
  String toString() => '$runtimeType';

  Widget call();
}

class UnInitState extends StateBase {
  @override
  List<Object> get props => ['$runtimeType'];

  @override
  Widget call() => DefaultCircularProgressIndicator();

}

abstract class InState extends StateBase {
  @override
  List<Object> get props => ['$runtimeType'];

  @override
  Widget call();
}

abstract class ListState<T> extends InState {
  final List<T> propss;

  ListState(this.propss);

  String toString() {
     return '$runtimeType { ${propss == null ? '' :propss } }';
  }

  List<Object> get props =>propss;

}
abstract class ModelState<T extends ModelBase> extends InState{
  final T bean;

  ModelState(this.bean);

  String toString() {
     return '$runtimeType { ${bean == null ? '' :bean.toJson().toString() } }';
  }

  List<Object> get props => [bean];
}

