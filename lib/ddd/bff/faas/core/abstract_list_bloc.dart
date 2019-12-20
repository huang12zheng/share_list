// import 'package:share_lists/ddd/list/index.dart';

import 'package:share_lists/ddd/list/list_handle.dart';

import 'abstract_item_bloc.dart';
import 'index.dart';

export 'abstract_item_bloc.dart';

abstract class ListBloc<State extends ListStateImpl<Item>,Item extends ItemBloc> extends BlocBase {
  final ListHandle handle;
  final List<Item> items;

  ListBloc(this.handle, this.items);
}

// class Fetch<T> extends InitEvent<T> {
//   Fetch(T param) : super(param);
//   @override
//   Stream<InState> applyAsync(InState state, BlocBase bloc) {
//     return null;
//   }
// }

class Fetch<T> extends InitEvent<T> {
  Fetch(T param) : super(param);
  
  @override
  Stream<ListStateImpl> applyAsync(UnInitState state, covariant ListBloc bloc) {
    return null;
  }
}

class FetchMore<T> extends PatchEvent {
  final T param;

  FetchMore(this.param);

  @override
  Stream<ListStateImpl> applyAsync(ListStateImpl state, covariant ListBloc bloc) {
    return null;
  }
}

abstract class ListStateImpl<T> extends ListState<T> {
  final bool hasReachedMax;
  ListStateImpl(List<T> items, {this.hasReachedMax = true}) : super(items);
}