import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:share_lists/item/item_model.dart';
import 'package:share_lists/lists/index.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  final List<Item> items;
  final String type;

  ListsBloc(this.items, {this.type ='trend'});

  @override
  Future<void> close() async{
    super.close();
  }

  ListsState get initialState => ListsState(items);

  @override
  Stream<ListsState> mapEventToState(
    ListsEvent event,
  ) async* {
    try {
      yield*  event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ListsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
