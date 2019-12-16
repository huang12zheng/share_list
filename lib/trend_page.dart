import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_lists/item_data/item_data.dart';
import 'package:share_lists/screen.dart';

import 'lists/index.dart';

class TrendPage extends StatelessWidget {
  const TrendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListsBloc(
        // initDatas
        datas
      ),
      child: ListScrean(),
    );
  }
}