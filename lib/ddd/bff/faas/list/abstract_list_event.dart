import 'index.dart';
abstract class InitOrRefreshEvent<P,T> extends InitEvent<P> with ToListStateable<T> {
  InitOrRefreshEvent(P param) : super(param);

  @override
  Stream<InState> applyAsync(UnInitState state, covariant ListBloc bloc) async*{
    yield modelToState(await bloc.handle.fetch([]));
  }
}

abstract class FetchMoreEvent<T> extends PatchEvent with ToListStateable {
  final T param;

  FetchMoreEvent(this.param);

  @override
  Stream<ListStateImpl> applyAsync(ListStateImpl state, covariant ListBloc bloc) async* {
    yield modelToState(await bloc.handle.fetch(state.items));
  }
}

abstract class RemoveEvent<T> extends PatchEvent with ToListStateable<T> {
  final T item;

  RemoveEvent(this.item);

  @override
  Stream<InState> applyAsync(ListStateImpl<T> state,covariant ListBloc<T> bloc) async*{
    yield modelToState(await bloc.handle.remove(state.items,item));
  }
}
/// filter would change state.
/// [filter] is just use state.filterBuilder() unless state.call()
// abstract 
abstract class FliterEvent<T> extends DeriveEvent with ToListStateable<T> {
}
/// can't extends EventBase
