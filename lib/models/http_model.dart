class ToDoModel {
  int? id;
  String? title;
  bool? status;

  ToDoModel({this.title, this.id, this.status});
   ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['completed'];
   
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.status;
    return data;
  }
}
