import 'dart:io';
import 'todolist.dart';


void main() {

  bool isRunning = true;
  var mToDo = ToDoList();


  mToDo.showList();


  while (isRunning) {
    stdout.writeln(' To add 1 element type \x1B[31m add \x1B[0m \n To add group elements type \x1B[31m group \x1B[0m \n To remove element by ID type \x1B[31m del \x1B[0m \n to see all tasks type \x1B[31m tasks \x1B[0m \n to see statistics type \x1B[31m stat \x1B[0m');
    String input = stdin.readLineSync().toString();

    switch (input) {
      case "add":
        mToDo.addElement();
        break;
      case "group":
        mToDo.addGroup();
        break;
      case "del":
        mToDo.deleteTask();
        break;
      case "tasks":
        mToDo.showList();
        break;
      case "stat":
        mToDo.statistic();
        break;
      default:
        print('Unknown command');
        break;
    }


    stdout.writeln("Continue?: \n \x1B[31m yes \x1B[0m \n \x1B[31m no \x1B[0m");
    String answer = stdin.readLineSync().toString();

    switch (answer) {
      case "yes":
        isRunning = true;
        break;
      case "no":
        isRunning = false;
        break;
      default:
        print ('Unknown command');
        isRunning = true;
        break;
    }


  }



}


