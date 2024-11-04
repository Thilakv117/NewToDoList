import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/to_do_bloc.dart';
import 'package:to_do_list/models/http_model.dart';

enum Status {
  pending,
  all,
  completed,
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<ToDoBloc>().add(FetchData());
  }

  bool _isValue = false;
  List<ToDoModel> lists = [];

  TextEditingController controller = TextEditingController();
  TextEditingController Editcontroller = TextEditingController();
  Status value = Status.pending;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task List"),
      ),
      body: Center(
        child: BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
          if (state is ToDoLoaded) {
            lists = state.model;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SegmentedButton<Status>(
                    multiSelectionEnabled: true,
                    segments: const [
                      ButtonSegment<Status>(
                        value: Status.pending,
                        icon: Icon(Icons.pending),
                        label: Text("Pending"),
                      ),
                      ButtonSegment<Status>(
                        value: Status.all,
                        icon: Icon(Icons.all_inbox),
                        label: Text("All"),
                      ),
                      ButtonSegment<Status>(
                        value: Status.completed,
                        icon: Icon(Icons.calendar_view_month),
                        label: Text("Completed"),
                      ),
                    ],
                    selected: <Status>{value},
                    onSelectionChanged: (Set<Status> newSelection) {
                      setState(() {
                        value = newSelection.last;
                      });
                    },
                  ),
                ),
                TextField(),
                Expanded(
                  child: ListView.builder(
                    itemCount: lists.length,
                    itemBuilder: (context, index) {
                      final list = lists[index];
                      return ListTile(
                        title: ExpansionTile(
                          title: Text(
                            list.title.toString(),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Checkbox(
                                  value: _isValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _isValue = value!;
                                    });
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<ToDoBloc>().add(
                                        DeleteData(id: list.id.toString()));
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _EditdialogBuilder(context, list);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogBuilder(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Title'),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Create'),
              onPressed: () {
                context.read<ToDoBloc>().add(AddData(controller.text));
                Navigator.of(context).pop();
                controller.clear();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _EditdialogBuilder(BuildContext context, list) {
    List<ToDoModel> edit = [];
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Title'),
          content: TextField(
            controller: Editcontroller,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Edit'),
              onPressed: () {
                context.read<ToDoBloc>().add(EditData(
                    id: list.id.toString(), title: Editcontroller.text));
                Navigator.of(context).pop();
                Editcontroller.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
