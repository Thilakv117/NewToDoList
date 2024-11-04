part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}
class FetchData extends ToDoEvent {}

class AddData extends ToDoEvent {
  final title;
  AddData(this.title);
}

class DeleteData extends ToDoEvent {
  final id;
  DeleteData({required this.id});
}

class EditData extends ToDoEvent {
  final id;
  final title;
  EditData({required this.id, required this.title});
}