import 'dart:async';

import 'package:share_lists/item/index.dart';
import 'package:share_lists/item/item_model.dart';
import 'package:share_lists/lists/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListsEvent {
  Stream<ListsState> applyAsync(
      {ListsState currentState, ListsBloc bloc});
}

class FilterEvent extends ListsEvent {
  final ItemType type;

  FilterEvent(this.type);
  @override
  Stream<ListsState> applyAsync({ListsState currentState, ListsBloc bloc}) async *{
    yield ListsState(currentState.items.where((item)=>item.type==type) );
  }
}

class Fetch extends ListsEvent {
  final String type;

  Fetch(this.type);
  @override
  Stream<ListsState> applyAsync({ListsState currentState, ListsBloc bloc}) async * {
    final items = currentState.items;
    await bloc.handle.fetch(items);
    yield ListsState(await bloc.handle.fetch(items));
  }
}

