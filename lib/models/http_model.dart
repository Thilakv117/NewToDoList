class ToDoModel {
  int? id;
  String? title;

  ToDoModel({this.title, this.id});
   ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
   
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
