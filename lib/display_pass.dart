import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expense_list.dart';

Column displayTaskAndDate(ExpenseList e) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
          child: Text(
            '${e.pass}',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                backgroundColor: Colors.white),
          ),
      ),
    ],
  );
}
