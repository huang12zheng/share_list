import 'dart:async';
import 'dart:developer' as developer;

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'index.dart';

class ItemBloc extends HydratedBloc<ItemEvent, ItemState> {
  final String id;

  ItemBloc(this.id);
  @override
  Future<void> close() async{
    super.close();
  }

  ItemState get initialState => super.initialState ?? (Item(id,0));

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
}
