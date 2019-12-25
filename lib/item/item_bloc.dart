import 'package:share_lists/ddd/bff/faas/faas.dart';
import 'package:share_lists/item/widget/wrap/item_wrap.dart';

import 'item_model.dart';

class ItemBloc extends ItemBlocBase{
  @override
  Future<void> close() async{
    dependeds[id]-=1;
    debugPrint('close $id count: ${dependeds[id]}');
    if (dependeds[id] == 0)
    {
      _cache.remove(id); /// check index
      super.close();
    }
  }

  factory ItemBloc(String id) {
    if (_cache.containsKey(id)) {
      return _cache[id];
    } else {
      final bloc = ItemBloc._(id);
      _cache[id] = bloc;
      dependeds[id] = 0;
      return bloc;
    }
  }

  static get cache => _cache;
  static final Map<String, ItemBloc> _cache =
      <String, ItemBloc>{};
  static final  Map<String,int> dependeds = <String,int> {};

  ItemBloc._(id);
  @override
  InState fromJson(Map<String, dynamic> json) {
    return null;
  }
}

class ItemState extends ModelState<ItemModel>{
  ItemState(ItemModel bean) : super(bean);
  @override
  Widget call() => ItemWidget(item: bean);

}

class ItemModel extends ModelBase{
  final String id;
  final int desc;
  final ItemType type; 

  ItemModel(this.id, this.desc, {this.type = ItemType.trend});
  @override
  Map<String, dynamic> toJson() => { 'id': id, 'desc': desc, 'type': type };

  @override
  List<Object> get props => [id,desc,type];

}