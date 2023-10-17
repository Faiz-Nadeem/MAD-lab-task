import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/todo.dart';
class TodoProvider extends ChangeNotifier{
List <Todo> todos=[];                //listname name todos and Todo is variable
List <Todo> get todolist=> todos;    //return todo list by using getter method
// List <Todo> getTodos(){
// List<Todo> todolist = todos;
// return todolist;
 addTodo(Todo todo){
  todos.add(todo);
  notifyListeners();
 }
 removeTodo(int index ){
  todos.removeAt(index);
  notifyListeners();
 }
 toggleisdone(int index){
  todolist[index].isDone = !todolist[index].isDone;  // ! is indicating (not equal) it means if we click on check box it will change its state from false to true and we unchecked it it will change its state from true to false
  notifyListeners();
 }
}
