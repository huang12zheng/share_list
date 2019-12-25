
import 'package:equatable/equatable.dart';

abstract class ModelBase with EquatableMixin {
  Map<String, dynamic> toJson();

  @override
  String toString() => '$runtimeType';
}