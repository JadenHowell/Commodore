import 'package:flutter/material.dart';

class User{
  final String name;
  final Color color;
  int money = 0;
  final Map<User, int> stocks = {};

  User({required this.name, required this.color, required this.money});

}