import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'index.dart';

class ItemBloc extends HydratedBloc<ItemEvent, ItemState> {
  final String id;

  // ItemBloc(this.id);
  @override
  Future<void> close() async{
    dependeds[id]-=1;
    debugPrint('close $id count: ${dependeds[id]}');
    if (dependeds[id] == 0)
    {
      _cache.remove(id); /// check index
      super.close();
    }
  }

  factory ItemBloc(String id) {
    if (_cache.containsKey(id)) {
      return _cache[id];
    } else {
      final bloc = ItemBloc._(id);
      _cache[id] = bloc;
      dependeds[id] = 0;
      return bloc;
    }
  }
  static get cache => _cache;
  static final Map<String, ItemBloc> _cache =
      <String, ItemBloc>{};
  static final  Map<String,int> dependeds = <String,int> {};

  ItemState get initialState => super.initialState ?? (ItemState(Item(id,0)));

  ItemBloc._(this.id);

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    try {
      yield* event.applyAsync(state, this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ItemBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }

  @override
  ItemState fromJson(Map<String, dynamic> json) {
    return ItemState(Item(json['id'],json['desc']));
  }

  @override
  Map<String, dynamic> toJson(ItemState state) {
    return {'id': state.item.id,'desc': state.item.desc};
  }

  onProvider(){
    dependeds[id]+=1;
    debugPrint('onProvider $id count: ${dependeds[id]}');
  }
}
