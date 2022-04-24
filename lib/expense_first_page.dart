import 'package:flutter/material.dart';
import 'expense_list.dart';
import 'display_text.dart';
import 'display_pass.dart';
import 'display_comm.dart';

class ExpenseFirstPage extends StatefulWidget {
  const ExpenseFirstPage({Key? key}) : super(key: key);

  @override
  _ExpenseFirstPageState createState() => _ExpenseFirstPageState();
}



class _ExpenseFirstPageState extends State<ExpenseFirstPage> {
  final List<ExpenseList> expenseList = [];

  void addTaskAndAmount(String txt, int pass, String comment) {
    final expense = ExpenseList(
      text: txt,
      pass: pass,
      comm: comment,
      id:DateTime.now().toString(),
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

  final contrl_1 = TextEditingController();
  final contrl_2 = TextEditingController();
  final contrl_3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
            Container(
            child: Column(
              children: expenseList.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 200,
                    child:Card(
                      elevation: 10,
                      child: Column(
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Текст пароля'),
                              displayAmount(e),
                          ]),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Пароль'),
                              displayTaskAndDate(e),
                          ]),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Комментарий'),
                              displayComm(e,)
                          ]),

                          TextButton.icon(
                            label: Text(
                        '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                          onPressed: () {
                          deleteExpenseList(e.id!);
                          },
                          
                          icon: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            Icon(Icons.delete),
                          ],
                          ) 
    
                    ),
                        ],
                      ),
                    ),
                    )
                    
                    
                  ],
                );
              }).toList(),
            ),
          ),

            Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              child: const Text('Добавить'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Text('Добавление пароля'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                              child: Column(                               
                            children: <Widget>[
                              TextFormField(
                                controller: contrl_1,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(width: 3,color: Colors.blue),
                                  ),
                                  labelText: 'Текст',
                                  icon: const Icon(Icons.text_fields),
                                ),
                              ),
                              const SizedBox(height: 12,),

                              TextFormField(
                                obscureText: true,
                                controller: contrl_2,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(width: 10,color: Colors.blue),
                                  ),
                                  labelText: 'Пароль',
                                  icon: const Icon(Icons.password),
                                ),
                              ),
                              const SizedBox(height: 12,),

                              TextFormField(
                                controller: contrl_3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(width: 3,color: Colors.blue),
                                  ),
                                  labelText: 'Сообщение',
                                  icon: const Icon(Icons.message),
                                ),
                              ),
                              
                              TextButton(onPressed: (){

                                addTaskAndAmount(contrl_1.text,int.parse(contrl_2.text),contrl_3.text);
                              },
                              child: Text('Подтвердить'))
                            ],
                            
                          )),
                
                        ),
                        // actions: [
                        //   RaisedButton(
                        //     child: const Text('Подтвердить'),
                        //     onPressed: (){
                        //       //txt = contrl_1.text;
                        //       //pass_txt = contrl_2.text;
                        //       //mess_txt = contrl_3.text;
                        //       //_addNewContactRow;
                        //       addTaskAndAmout(contrl_1.text,int.parse(contrl_2.text), contrl_3.text);
                        //       if(_forgotPassword){
                        //         _forgotPassword = false;
                                
                        //       }
                        //       else{
                        //         counter = counter + 1;
                        //         _forgotPassword = true;
                                
                        //       }
                        //     } 
                                 
                            
                        //   )
                        // ],
                      );
                    });
              },
            ),)
          
          
          
        ],
      ),
    );
  }
}
