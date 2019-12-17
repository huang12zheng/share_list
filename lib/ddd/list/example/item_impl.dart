import 'index.dart';

class ItemableImpl implements Itemable<Item>{
  Item item;

  @override
  updateFromList(item) {
    this.item = item;
    return true;
  }

}