import 'package:equatable/equatable.dart';

class BlocModel extends Equatable {
  final add;
  final remove;
  final update;
  final delete;
  BlocModel(
      {required this.add,
      required this.remove,
      required this.update,
      required this.delete});
  @override
  List<Object?> get props => [add, remove, update, delete];
  static List<BlocModel> userModel = [
    BlocModel(
      add: " ",
      remove: " ",
      update: " ",
      delete: " ",
    )
  ];
}
