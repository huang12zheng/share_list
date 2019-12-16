import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:share_lists/item/index.dart';
import 'package:share_lists/item/item_bloc.dart';
import 'package:share_lists/item/item_model.dart';
import 'package:share_lists/item_data/item_data.dart';
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
    if (type == 'trend') {
      yield ListsState([ ...currentState.items , ...fetchMore(currentState.items.length,datas)]);
    } else if (type == 'hot') {
      yield ListsState([ ...currentState.items , ...fetchMore(currentState.items.length,hotData)]);
    } 
  }

  List<Item> fetchMore(int itemLength,List<Item> source) {
    final bool hasReachedMax = (itemLength+5)<source.length;
    final int end = hasReachedMax ? (itemLength+5) : source.length;
    print('fetch $itemLength to $end');
    for (int index = itemLength; index<end; index++){
      ItemBloc(source[index].id).add(RefreshEvent(source[index]));
      print('refresh $index');
    }
    final _list = source.sublist(itemLength,end);
    return _list;
  }
}

