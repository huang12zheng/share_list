import 'index.dart';
/// XList->[ListableMixin]{
///   [Listable]+Domain{
///     [RemoteDataSource] + items
/// }}
abstract class ListHandle<T> {
  final RemoteDataSource<T> source;
  ListHandle(this.source);
  Future<List<T>>     add(List<T> items,T item);
  Future<List<T>>  remove(List<T> items,T item);
  /// items+ _fetch
  Future<List<T>>   fetch(List<T> items);
  List<T>          fliter(List<T> items,bool test(T element)); // Fliterable
  Future<bool> updateItem(Itemable<T> itemable,T item);
}

class ListHandleImpl<T> extends ListHandle<T>{
  ListHandleImpl(RemoteDataSource<T> source) : super(source);

  @override
  Future<List<T>> add(List<T> items, T item) async{
    List<T> _items;

    bool isSuccess = await source.add(item);
    if (isSuccess) _items = [...items, item];
    return _items;
  }

  /// [ a,b,...[]   ]
  /// [ a,b,...[1,2]]
  @override
  Future<List<T>> fetch(List<T> items) async{
    List<T> _fetch = await source.fetch({'length':items.length});
    return [...items ,... _fetch];
  }

  @override
  List<T> fliter(List<T> items, bool Function(T element) test) {
    return items.where(test);
  }

  @override
  Future<List<T>> remove(List<T> items, T item) async {
    List<T> _items=items;
    bool isSuccess = await source.remove(item);
    if (isSuccess) {
      _items = items.where((_item)=>_item!=item);
    }
    return _items;
  }

  @override
  Future<bool> updateItem(Itemable<T> itemable, T item) {
    return itemable.updateFromList(item);
  }
}

