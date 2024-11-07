part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}
class FetchData extends ToDoEvent {
  final status;
  FetchData(this.status);
}

class AddData extends ToDoEvent {
  final title;
  final status;
  final pageValue;
  
  AddData(this.title, this.status, this.pageValue);
}

class DeleteData extends ToDoEvent {
  final id;
  final status;
  DeleteData({required this.id, this.status});
}

class EditData extends ToDoEvent {
  final id;
  final title;
  final status;
  EditData({required this.id, required this.title, this.status});
}
class AllTaskList extends ToDoEvent{ 
  final status;
  AllTaskList({required this.status});
}

class FilterTask extends ToDoEvent {
  final id;
  final title;
  final status;
  FilterTask({required this.id, required this.title, required this.status});
}

