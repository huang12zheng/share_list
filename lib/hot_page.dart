import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_lists/ddd/list/example/data_source.dart';
import 'package:share_lists/ddd/list/example/index.dart';
import 'package:share_lists/item_data/item_data.dart';
import 'package:share_lists/screen.dart';

import 'lists/index.dart';

class HotPage extends StatelessWidget {
  const HotPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListsBloc(
        initHotData,
        ListHandleImpl<Item>(ItemDataSource(hotData)),
        type: 'hot'
      ),
      child: ListScrean(),
    );
  }
}