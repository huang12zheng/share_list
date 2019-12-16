import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_lists/item/index.dart';
import 'package:share_lists/item_data/item_factory.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 150,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          // return BlocProvider.value(
          //   value: ItemBloc(items[index].id),
          //   child: ItemDescWidget(),
          // );
          /// value method would be no GC
          return BlocProvider(
            create: (_)=> ItemBloc(items[index].id)..onProvider(),
            child: ItemDescWidget(),
          );
        },
      ),
    );
  }
}

class ItemDescWidget extends StatelessWidget {
  const ItemDescWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return state.desc();
      },
    );
  }
}
