import 'package:equatable/equatable.dart';
import 'index.dart';
abstract class EventBase extends Equatable {
  toString()=> '$runtimeType';
  Stream<InState> applyAsync(
      StateBase state, BlocBase bloc);
  List<Object> get props => ['$runtimeType'];
}
/// bug
abstract class InitEvent<T> extends EventBase{
  final T param;

  InitEvent(this.param);
  Stream<InState> applyAsync(
     covariant UnInitState state, BlocBase bloc);
  List<Object> get props => ['$runtimeType',param];
}

abstract class ResetEvent<T> extends EventBase{
  final T item;

  ResetEvent(this.item);
  Stream<InState> applyAsync(
     covariant InState state, BlocBase bloc);
  List<Object> get props => ['$runtimeType',item];
  
}

abstract class PatchEvent extends EventBase{
  Stream<InState> applyAsync(
     covariant InState state, BlocBase bloc);

}
/// prototype is filter
abstract class DeriveEvent extends EventBase{
  
  Stream<DeriveState> applyAsync(
    covariant InState state, BlocBase bloc) async*{
      yield (state as DeriveState)..params['bloc']=bloc;
    }
}