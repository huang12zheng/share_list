// class ItemEventBase
import 'index.dart';
/// [ModelState] is not a good comment, maybe using T being a good idea.
abstract class ItemPatchEvent<T extends ModelBase> extends PatchEvent with ToStateable<T> {
  @override
  Stream<ModelState> applyAsync(ModelState state, BlocBase bloc) async*{
    yield modelToState(state.bean);
  }

}