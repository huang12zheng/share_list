import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../index.dart';
import '../../item_bloc.dart';
import '../../item_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: ()=>BlocProvider.of<ItemBloc>(context).add(AddEvent()),
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('${item.id}'),
            GestureDetector(
              onTap: ()=>
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext ctx) {
                    return BlocProvider.value(
                      value: BlocProvider.of<ItemBloc>(context),
                      child: Detail(),
                    );
                  })
                ),
              child: Container(child: Text('${item.desc}'),color: Colors.red,)
            ),
            Text('${item.type}'),
          ],
        ),
      ),
    );
  }
}
