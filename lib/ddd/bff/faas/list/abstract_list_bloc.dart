// import 'package:share_lists/ddd/list/index.dart';

import 'package:share_lists/ddd/list/list_handle.dart';

import 'abstract_item_bloc.dart';
import 'index.dart';

export 'abstract_item_bloc.dart';

// abstract class ListBloc<Item,State extends ListStateImpl<Item>> extends BlocBase {
abstract class ListBloc<Item> extends BlocBase {
  final ListHandle<Item> handle;
  final List<Item> items;

  ListBloc(this.handle, this.items);
}

abstract class ListStateImpl<T> extends ListState<T> {
  final bool hasReachedMax;
  final List<T> items;
  ListStateImpl(this.items, {this.hasReachedMax = true}) : super(items);
}

abstract class FilterState<T> extends ListStateImpl<T> {
  final bool hasReachedMax;
  final List<T> items;
  FilterState(this.items, {this.hasReachedMax = true}) : super(items);
}


abstract class InitOrRefresh<P,T> extends InitEvent<P> with ToStateable<T> {
  InitOrRefresh(P param) : super(param);

  @override
  Stream<InState> applyAsync(UnInitState state, covariant ListBloc bloc) async*{
    yield modelToState(await bloc.handle.fetch([]));
  }

}

abstract class FetchMore<T> extends PatchEvent with ToStateable {
  final T param;

  FetchMore(this.param);

  @override
  Stream<ListStateImpl> applyAsync(ListStateImpl state, covariant ListBloc bloc) async* {
    yield modelToState(await bloc.handle.fetch(state.items));
  }
}

abstract class Remove<T> extends PatchEvent with ToStateable<T> {
  final T item;

  Remove(this.item);

  @override
  Stream<InState> applyAsync(ListStateImpl<T> state,covariant ListBloc<T> bloc) async*{
    yield modelToState(await bloc.handle.remove(state.items,item));
  }
}
/// filter would change state.
/// [filter] is just use state.filterBuilder() unless state.call()
// abstract 
abstract class Fliter<T> extends DeriveEvent with ToStateable<T> {
}

abstract class ToStateable<T> {
  InState modelToState(List<T> items);
}