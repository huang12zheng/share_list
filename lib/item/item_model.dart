import 'package:equatable/equatable.dart';

enum ItemType{
  trend,
  hot,
}

class Item extends Equatable{
  final String id;
  final int desc;
  final ItemType type; 

  Item(this.id, this.desc, {this.type = ItemType.trend});

  @override
  List<Object> get props => [id,desc];
}