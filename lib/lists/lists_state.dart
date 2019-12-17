import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:share_lists/item/index.dart';
import 'package:share_lists/lists/list_screen.dart';

class ListsState extends Equatable {
  
  final List<Item> items;
  final bool hasReachedMax;
  ListsState(this.items, {this.hasReachedMax = true});

  Widget call(){
    return ListWidget(items: items);
  }

  @override
  List<Object> get props => (items);

}
