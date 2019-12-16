import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_lists/item/index.dart';
import 'package:share_lists/item_data/item_factory.dart';
import 'package:share_lists/lists/list_screen.dart';

class ListsState extends Equatable {
  
  final List<Item> items;
  ListsState(this.items);

  Widget call(){
    return ListWidget(items: items);
  }

  @override
  List<Object> get props => (items);

}
