import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_lists/ddd/bff/faas/core/index.dart';

import '../index.dart';

class Detail extends StatelessWidget {
  const Detail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        final item = state.bean;
        TextEditingController controller = TextEditingController(text: item.desc.toString());
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Container(
              height: 200,
              width: 200,
              child: Column(
                children: <Widget>[
                  Text(item.id),
                  TextField(controller: controller),
                  RaisedButton(
                    onPressed: (){
                      BlocProvider.of<ItemBloc>(context).add(EditEvent(int.parse( controller.text)));
                      Navigator.of(context).pop();
                    },
                    child: Text('submit'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    
  }
}