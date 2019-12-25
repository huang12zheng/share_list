// import 'package:share_lists/ddd/list/index.dart';

import 'package:share_lists/ddd/list/list_handle.dart';
import 'index.dart';

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
