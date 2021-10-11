import 'dart:io';

import 'task.dart';

class ToDoList {

  Task todo = Task(1, 'run', 'sport');
  Task todo1 = Task(2, 'swim', 'sport');
  Task todo2 = Task(3, 'gym', 'sport');
  Task todo3 = Task(4, 'learn english', 'study');
  Task todo4 = Task(5, 'learn dart', 'study');

  List<Task> todos = [];


  void createList() {
    todos.add(todo);
    todos.add(todo1);
    todos.add(todo2);
    todos.add(todo3);
    todos.add(todo4);

  }

  void showList(){
    if (todos.isEmpty) {
      createList();
    }

    for (int i =0 ; i < todos.length; i++) {
      print('${todos[i].id}   ${todos[i].name} ');
    }
  }

  void deleteTask() {
    stdout.writeln('Enter ID of the task to delete');
    String ids = stdin.readLineSync().toString();
    int id = int.parse(ids);
    int position = -1;

    for (int i = 0; i < todos.length; i++) {
      if (todos[i].id == id) position = i;
    }
    if (position > 0) {
      todos.removeAt(position);

      for (int i = 0; i < todos.length; i++) {
        print('${todos[i].id}   ${todos[i].name}');
      }
    } else {
      print('no such ID found');
    }
  }

  void addElement() {
    int newID = 0;
    for (int i = 0; i<todos.length-1; i++) {
      newID = todos[i].id;
      if (newID < todos[i+1].id) newID = todos[i+1].id;
    }
    newID += 1;
    stdout.writeln('Enter new name to add');
    String newName = stdin.readLineSync().toString();
    stdout.writeln('Enter new category to add');
    String newCategory = stdin.readLineSync().toString();

    Task newTodo = Task(newID, newName, newCategory);
    todos.add(newTodo);

    showList();

  }

  void addGroup() {
    stdout.writeln('Type names of tasks using "," between tasks');
    String tasks = stdin.readLineSync().toString();
    List<String> tasksList = tasks.split(",");

    stdout.writeln('Type name of group for these tasks');
    String group = stdin.readLineSync().toString();

    int newID = 0;
    for (int i = 0; i < todos.length - 1; i++) {
      newID = todos[i].id;
      if (newID < todos[i + 1].id) newID = todos[i + 1].id;
    }
    newID += 1;

    for (int i = 0; i < tasksList.length; i++) {
      Task newTodo = Task(newID, tasksList[i], group);
      todos.add(newTodo);
      newID += 1;
    }

    showList();
  }

  void statistic() {
    int taskSummary;
    taskSummary = todos.length;
    print('Task summary :  $taskSummary');

    List listCategories = [];
     for (int i = 0; i < todos.length; i++) {
       listCategories.add(todos[i].category);
     }

     Map<String,int> map = {};

     for (String cat in listCategories) {
       if (map.containsKey(cat)) {
         map.update(cat, (value) => map[cat]!+1);
       } else {
         map.putIfAbsent(cat, () => 1);
       }
     }

     print(map);

  }







}