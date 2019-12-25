import 'index.dart';

/// [Event] of [ItemBloc] is [InitEvent],[PatchEvent]
abstract class ItemBlocBase<State extends ModelState> extends BlocBase{

  // @override
  // Future<void> close() async{
  //   dependeds[id]-=1;
  //   debugPrint('close $id count: ${dependeds[id]}');
  //   if (dependeds[id] == 0)
  //   {
  //     _cache.remove(id); /// check index
  //     super.close();
  //   }
  // }

  // factory ItemBloc(String id) {
  //   if (_cache.containsKey(id)) {
  //     return _cache[id];
  //   } else {
  //     final bloc = ItemBloc._(id);
  //     _cache[id] = bloc;
  //     dependeds[id] = 0;
  //     return bloc;
  //   }
  // }

  // static get cache => _cache;
  // static final Map<String, ItemBloc> _cache =
  //     <String, ItemBloc>{};
  static final  Map<String,int> dependeds = <String,int> {};

  // ItemBloc._(id);

  didProvider(){
    dependeds[id]+=1;
    debugPrint('didProvider $runtimeType $id count: ${dependeds[id]}');
  }

  @override
  Map<String, dynamic> toJson(State state) {
    return state.bean.toJson();
  }

  @override
  UnInitState get unState => UnItemState();

}

class UnItemState extends UnInitState{
  Widget call()=> Container();
}

abstract class InItemState extends InState {
  @override
  List<Object> get props => ['$runtimeType'];

  @override
  Widget call();
}

