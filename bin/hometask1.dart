import 'dart:io';
import 'todolist.dart';


void main() {

  bool isRunning = true;
  var todosiki = ToDoList();

  todosiki.showList();


  while (isRunning) {
    //stdout.writeln("Выберите действие и введите одну из комманд: \n ADD \n EDIT \n DELETE \n LIST \n TASKS");
    stdout.writeln(' To add 1 element type ADD \n To add group elements type GROUP \n To remove element by ID type DEL \n to see all tasks type TASKS \n to see statistics type STAT');
    String input = stdin.readLineSync().toString();

    switch (input) {
      case "ADD":
        todosiki.addElement();
        break;
      case "GROUP":
        todosiki.addGroup();
        break;
      case "DEL":
        todosiki.deleteTask();
        break;
      case "TASKS":
        todosiki.showList();
        break;
      case "STAT":
        todosiki.statistic();
        break;
      default:
        print('Unknown command');
        break;
    }


    stdout.writeln("Продолжить: \n YES \n NO");
    String answer = stdin.readLineSync().toString();

    switch (answer) {
      case "YES":
        isRunning = true;
        break;
      case "NO":
        isRunning = false;
        break;
      default:
        print ('Unknown command');
        isRunning = true;
        break;
    }


  }



}


