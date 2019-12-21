import 'package:flutter/cupertino.dart';

import 'index.dart';
/// Since state of bloc is transformative, Blocless is no sense.
/// Bloc is just TemplatePattern, Event is Hook
abstract class BlocBase extends HydratedBloc<EventBase,StateBase> {
  String get id;

  get initialState => super.initialState ?? unState;

  UnInitState get unState;

  @mustCallSuper
  Stream<InState> mapEventToState(
    EventBase event,
  ) async* {
    if (event is! InitEvent || event is! ResetEvent || event is! PatchEvent)
      throw Exception('it is out of architecture');
    // yield* event.applyAsync(state, this);
    yield* applyAsync(event);
  }
  /// TODO: handle reCall
  Stream<InState> applyAsync(EventBase event) => event.applyAsync(state, this);

  @override
  InState fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson(covariant InState state);

  @override
  String toString() => '$runtimeType $id';
}

// / should never dispatch event unless InitEvent
// / maybe InitEvent is also no need.
abstract class Blocless extends BlocBase {
  @override
  Stream<InState> mapEventToState(
    EventBase event,
  ) async* {
    super.mapEventToState(event);
    if (event is InitEvent)
      yield* event.applyAsync(state, this);
  }
}