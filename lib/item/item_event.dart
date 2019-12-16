import 'dart:async';
import 'dart:developer' as developer;

import 'package:share_lists/item/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ItemEvent {
  Stream<ItemState> applyAsync(
      ItemState state, ItemBloc bloc);
}


class AddEvent extends ItemEvent {
   
  @override
  String toString() => 'LoadItemEvent';

  @override
  Stream<ItemState> applyAsync(
      ItemState state, ItemBloc bloc) async* {
    try {
      yield ItemState(Item(state.item.id,state.item.desc+1,type:state.item.type));
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadItemEvent', error: _, stackTrace: stackTrace);
    }
  }
}


class EditEvent extends ItemEvent {
  EditEvent(this.desc);

   
  @override
  String toString() => 'LoadItemEvent';

  final int desc;
  
  @override
  Stream<ItemState> applyAsync(
      ItemState state, ItemBloc bloc) async* {
    try {
      yield ItemState(Item(state.item.id,desc,type:state.item.type));
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadItemEvent', error: _, stackTrace: stackTrace);
    }
  }
}

class RefreshEvent extends ItemEvent {
  RefreshEvent(this.item);
  final Item item;

   
  @override
  String toString() => 'LoadItemEvent';
  
  @override
  Stream<ItemState> applyAsync(
      ItemState state, ItemBloc bloc) async* {
    try {
      yield ItemState(item);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadItemEvent', error: _, stackTrace: stackTrace);
    }
  }
}