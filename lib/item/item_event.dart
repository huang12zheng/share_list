import 'package:share_lists/ddd/bff/faas/core/index.dart';
import 'package:share_lists/ddd/bff/faas/list/item/abstract_item_event.dart';

import 'index.dart';

class AddEvent extends ItemPatchEvent<ItemModel> {
  @override
  InState modelToState(ItemModel model) {
    return ItemState(ItemModel(model.id,model.desc+1,type:model.type));
  }
}


class EditEvent extends ItemPatchEvent<ItemModel> {
  EditEvent(this.desc);

  final int desc;
  /// [copyWith] is need
  @override
  InState modelToState(ItemModel model) {
    return ItemState(ItemModel(model.id,desc,type:model.type));
  }
}

class RefreshEvent extends ItemPatchEvent<ItemModel> {
  RefreshEvent(this.item);
  final ItemModel item;
  @override
  InState modelToState(ItemModel model) {
    return ItemState(item);
  }
}