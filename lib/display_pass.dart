import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'expense_list.dart';
import 'main.dart';

Column displayTaskAndDate(ExpenseList e)  {
  final contrl_2 = TextEditingController();
  contrl_2.text = e.pass.toString();
  bool _showPassword = true;
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        
        child: Container(
          height: 18,
          width: 100,
          child: TextFormField(
            readOnly: true,
             obscureText: false,
            controller: contrl_2,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
          ),
        ),
      ),
      )
    ],
  );
}
