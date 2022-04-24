import 'package:flutter/material.dart';
import 'expense_first_page.dart';

class ExpenseApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ExpensePage(),
    );
  }
}

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заметки паролей'),
      ),
      body: ExpenseList(),
    );
  }
}

class ExpenseList extends StatelessWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Card(
            elevation: 10,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ExpenseFirstPage(),
      ],
    );
  }
}
