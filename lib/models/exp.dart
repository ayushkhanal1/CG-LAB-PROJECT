//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
final formatter= DateFormat.yMd();

const uuid = Uuid();
enum Category {food,travel,leisure,work}
const categoryIcons={
  Category.food:Icons.lunch_dining,
  Category.leisure:Icons.movie,
  Category.travel:Icons.flight,
  Category.work:Icons.work
};
class Exp {
  Exp({required this.title, required this.amount, required this.date,required this.category})
      : id = uuid.v4();
  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;
  String getformatteddate()
  {
    return formatter.format(date);
  }
}
