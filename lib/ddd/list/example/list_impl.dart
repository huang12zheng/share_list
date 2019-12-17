import 'index.dart';
class ItemListableImpl with ListableMixin<Item> {
  ItemListableImpl(this.items, this.source);

  final List<Item> items;
  final RemoteDataSource<Item> source;

}