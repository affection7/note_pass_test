import 'package:flutter/material.dart';

import 'expense_list.dart';

Column displayComm(ExpenseList e) {
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
            '${e.comm}',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                backgroundColor: Colors.white),
          ),
      ),
    ],
  );
}
