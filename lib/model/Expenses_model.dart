import 'dart:core';

class ExpensesModel {
  String? key;
  String? title;
  String? category;
  String? description;
  String? image;
  double? money;
  String? startTime;
  String? endTime;
  String? date;
  String? show;
  String? status;

  ExpensesModel(
      { required this.key,
       required this.startTime,
       required this.endTime,
        required this.date,
        required this.money,
        required this.description,
        required this.category,
        required this.title,
        required this.image,
        required this.show,
        required this.status});

  ExpensesModel.fromMap(Map<String, dynamic> res) {
    key = res['key'];
    title = res['title'];
    category = res['category'];
    description = res['description'];
    image = res['image'];
     money=res['money'];
    show = res['show'];
    startTime = res['startTime'];
    endTime = res['endTime'];
    date = res['date'];
    status=res['status'];
  }

  Map<String, Object?> toMap() {
    return {
      'key': key,
      'title': title,
      'category': category,
      'description': description,
      'image': image,
      'money':money,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'show': show,
      'status' : status,
    };
  }
}