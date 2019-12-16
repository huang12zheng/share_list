import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lists/index.dart';

class ListScrean extends StatelessWidget {
  const ListScrean({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListsBloc, ListsState>(
      builder: (context, state) {
        return state.call();
      },
    );
  }
}