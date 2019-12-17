import 'index.dart';
/// XList->[ListableMixin]{
///   [Listable]+Domain{
///     [RemoteDataSource] + items
/// }}
abstract class Listable<T>{
  Future<List<T>> add(T item);
  Future<List<T>> remove(T item);
  Future<List<T>> fetch();
  Future<bool> updateItem(Itemable<T> itemable,T item);
  List<T> fliter(bool test(T element)); // Fliterable
}

mixin ListableMixin<T> implements Listable<T> {

  List<T> get items;
  RemoteDataSource<T> get source;

  @override
  Future<List<T>> add(item) async {
    source.add(item);
    return [...items, item];
  }
  /// maybe fetch many type, but it is due to diff [source]s
  @override
  fetch() async{
    List<T> _fetch = await source.fetch();
    /// [ a,b,...[]   ]
    /// [ a,b,...[1,2]]
    return [...items ,... _fetch];
  }

  @override
  List<T> fliter(bool Function(T element) test) {
    return items.where(test);
  }

  @override
  Future<List<T>> remove(item) async {
    bool isSuccess = await source.remove(item);
    if (isSuccess) items.remove(item);
    return items;
  }
  /// it maybe not place this.
  @override
  Future<bool> updateItem(itemable,item) {
    return itemable.updateFromList(item);
  }
}