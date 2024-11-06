part of 'to_do_bloc.dart';

sealed class ToDoState extends Equatable {
  const ToDoState();
  
  @override
  List<Object> get props => [];
}

final class ToDoInitial extends ToDoState {}
final class ToDoLoading extends ToDoState {}
final class ToDoLoaded extends ToDoState {
  final List<ToDoModel> model;
  ToDoLoaded({required this.model});
  @override 
  List<Object>get props => [model];
}

final class ToDoPending extends ToDoState{}
final class ToDoCompleted extends ToDoState{}