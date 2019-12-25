import 'package:share_lists/ddd/list/support/remote_interface.dart';

import 'index.dart';

class ItemDataSource extends RemoteDataSource<ItemModel>{
  final List<ItemModel> source;

  ItemDataSource(this.source);

  @override
  Future<bool> add(item) => null;

  // @override
  // Future<List<ItemModel>> fetch() async {
  //   return fetchMore(length,source);
  // }
  @override
  Future<List<ItemModel>> fetch(Map<String, dynamic> params) async {
    return fetchMore(params['length'],source);
  }

  @override
  Future<bool> remove(item) => null;

  @override
  Future<bool> update(item)  => null;
  
  List<ItemModel> fetchMore(int itemLength,List<ItemModel> source) {
    final bool hasReachedMax = (itemLength+5)<source.length;
    final int end = hasReachedMax ? (itemLength+5) : source.length;
    print('fetch $itemLength to $end');
    for (int index = itemLength; index<end; index++){
      ItemBloc(source[index].id).add(RefreshEvent(source[index]));
      print('refresh $index');
    }
    final _list = source.sublist(itemLength,end);
    return _list;
  }

}