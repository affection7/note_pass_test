import 'package:flutter/material.dart';
import 'display_comm.dart';
import 'display_pass.dart';
import 'display_text.dart';
import 'expense_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Заметки паролей'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ExpenseList> expenseList = [];

  void addTaskAndAmount(String txt, String pass, String comment) {
    final expense = ExpenseList(
      text: txt,
      pass: pass,
      comm: comment,
      id: DateTime.now().toString(),
    );
    setState(() {
      expenseList.add(expense);
    });
  }

  void deleteExpenseList(String id) {
    setState(() {
      expenseList.removeWhere((element) => element.id == id);
    });
  }

  void updateStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final contrl_1 = TextEditingController();
  final contrl_2 = TextEditingController();
  final contrl_3 = TextEditingController();
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Заметки паролей', style: TextStyle()),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Column(
          children: [
            Expanded(
                child: SizedBox(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: expenseList.map((e) {
                      return Column(
                        children: [
                          Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            elevation: 10,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text('Текст пароля'),
                                                  Row(
                                                    children: [
                                                      displayAmount(e),
                                                    ],
                                                  )
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text('Пароль'),
                                                  Row(
                                                    children: [
                                                      displayTaskAndDate(e),
                                                    ],
                                                  )
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text('Комментарий'),
                                                  displayComm(
                                                    e,
                                                  )
                                                ]),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: MaterialButton(
                                                  onPressed: () {
                                                    deleteExpenseList(e.id!);
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: const [
                                                      Icon(Icons.delete,
                                                          color: Colors.red),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            )),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        //color: Colors.red,
        onPressed: () {
          contrl_1.text = '';
          contrl_2.text = '';
          contrl_3.text = '';
          showDialog(
              context: context,
              builder: (
                BuildContext context,
              ) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  scrollable: true,
                  title: Center(child: Text('Добавление пароля')),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: contrl_1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.blue),
                            ),
                            labelText: 'Текст',
                            icon: const Icon(Icons.text_fields),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          validator: (inputValue) {
                            if (inputValue!.isEmpty) {
                              return 'Пожалуйста введите пароль'; // r94835h9843h8t5r34j8t
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText ? false : true,
                          controller: contrl_2,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    width: 10, color: Colors.blue),
                              ),
                              labelText: 'Пароль',
                              icon: const Icon(Icons.password),
                              suffixIcon: IconButton(
                                  icon: Icon(_obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () => updateStatus())),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: contrl_3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.blue),
                            ),
                            labelText: 'Сообщение',
                            icon: const Icon(Icons.message),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                            height: 35,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                                if (contrl_2.text.isEmpty) {
                                } else {
                                  addTaskAndAmount(contrl_1.text, contrl_2.text,
                                      contrl_3.text);
                                }
                              });
                            },
                            child: Text('Подтвердить',
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colors.white)))
                      ],
                    )),
                  ),
                );
              });
        },
        child: Container(
          child: Icon(Icons.add, size: 25),
        ),
      ),
    );
  }
}
