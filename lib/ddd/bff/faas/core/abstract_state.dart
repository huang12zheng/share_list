
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
}

abstract class DeriveState<Bloc> extends InState {
  final Map<dynamic,dynamic> params = {};
  @override
  List<Object> get props => ['$runtimeType'];

  Widget call() => dervice();
  Widget dervice();
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

  // String toString() {
  //    return '$runtimeType { ${bean == null ? '' :bean.toJson().toString() } }';
  // }
  String toString()=> '$runtimeType { ${(bean?.toJson())??''} }';

  List<Object> get props => [bean];
}

