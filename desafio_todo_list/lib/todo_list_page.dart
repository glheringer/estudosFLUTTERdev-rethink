import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  TextEditingController _textEditingController = TextEditingController();
  List<String> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(tasks[index]),
                    onLongPress: (){
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                    );
                },
              ),
            ),
          ]
          ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        
        children: [
          FloatingActionButton(
            onPressed: (){
              if(_textEditingController.text.length > 0){
                setState(() {
                  tasks.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
              print(tasks);
            },
            backgroundColor: Colors.purple.shade700,
            child: Icon(Icons.add),
            ),
            FloatingActionButton(
            onPressed: (){
              setState(() {
                tasks = [];
              });
              _textEditingController.clear();
          
            },
            backgroundColor: Colors.purple.shade700,
            child: Icon(Icons.remove),
            ),
        ],
      ),
    );
  }
}