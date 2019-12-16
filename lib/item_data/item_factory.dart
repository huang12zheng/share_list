// import 'package:share_lists/item/index.dart';

// class ItemFactory extends ItemBloc {
//   factory ItemFactory(String id) {
//     if (_cache.containsKey(id)) {
//       return _cache[id];
//     } else {
//       final bloc = ItemBloc(id);
//       _cache[id] = bloc;
//       dependeds[id] = 0;
//       return bloc;
//     }
//   }
//   static final Map<String, ItemBloc> _cache =
//       <String, ItemBloc>{};
//   static final  Map<String,int> dependeds = <String,int> {};
  
//   @override
//   Future<void> close() async{
//     dependeds[id]-=1;
//     if (dependeds[id] == 0)
//     {
//       _cache.remove(id); /// check index
//       super.close();
//     }
//   }
//   static get cache=> _cache;

//   onProvider(){
//     dependeds[id]+=1;
//   }
// }

