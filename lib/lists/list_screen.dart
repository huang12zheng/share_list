import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_lists/item/index.dart';

import 'index.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<Item> items;

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;
   @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          // return BlocProvider.value(
          //   value: ItemBloc(items[index].id),
          //   child: ItemDescWidget(),
          // );
          /// value method would be no GC
          return BlocProvider(
            create: (_)=> ItemBloc(widget.items[index].id)..onProvider(),
            child: ItemDescWidget(),
          );
        },
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      //ignore: close_sinks
      final bloc = BlocProvider.of<ListsBloc>(context);
      bloc.add(Fetch(BlocProvider.of<ListsBloc>(context).type));
      // bloc.close();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
