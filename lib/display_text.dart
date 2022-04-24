import 'package:flutter/material.dart';
import 'expense_list.dart';

Container displayAmount(ExpenseList e) {
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
      child: Text(
        '${e.text}',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
  );
}
