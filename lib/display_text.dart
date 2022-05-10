import 'package:flutter/material.dart';
import 'expense_list.dart';

Column displayAmount(ExpenseList e) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
          child: 
          Container(
            
            height: 18,
            width: 100,
            child:  Text(
            '${e.text}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),)
          
      ),
    ],
  );
}
