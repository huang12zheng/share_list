import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

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

// class LoadTrenEvent extends ListsEvent {
//   // final ItemType type;

//   LoadTrenEvent();
//   @override
//   Stream<ListsState> applyAsync({ListsState currentState, ListsBloc bloc}) async *{
//     // int id = Random().nextInt(100);
//     // yield ListsState(bloc.items.where((item)=>item.type==type) );
//   }
// }

// class LoadHotEvent extends ListsEvent {
//   // final ItemType type;

//   LoadHotEvent();
//   @override
//   Stream<ListsState> applyAsync({ListsState currentState, ListsBloc bloc}) async *{
//     yield ListsState(bloc.items.where((item)=>item.type==type) );
//   }
// }

// class LoadListsEvent extends ListsEvent {
   
//   final bool isError;
//   @override
//   String toString() => 'LoadListsEvent';

//   LoadListsEvent(this.isError);

//   @override
//   Stream<ListsState> applyAsync(
//       {ListsState currentState, ListsBloc bloc}) async* {
//     try {
//     } catch (_, stackTrace) {
//       developer.log('$_', name: 'LoadListsEvent', error: _, stackTrace: stackTrace);
//       // return ErrorListsState(0, _?.toString());
//     }
//   }
// }
