
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thought_keeper/Constant.dart';

class Thoughts{
  Thoughts(BuildContext context){
    this.context = context;
  }

  List<String> _thoughts = [];
  var context;

  _initate() async{
    _thoughts = [
      "You’re off to great places, today is your day. Your mountain is waiting, so get on your way.",
      "You always pass failure on the way to success.",
      "Winning doesn’t always mean being first. Winning means you’re doing better than you’ve done before.",
      "You’re braver than you believe, and stronger than you seem, and smarter than you think."
    ];
  }

  getThoughts(){
    return _thoughts;
  }

  add(value){
    _thoughts.add(value);
  }

  read() async {
    _thoughts = [];
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/thought.json');
      if(!file.existsSync()){
        flashMessage('File not exist');
        print('File not exist');
        return false;
      }
      String text = await file.readAsString();
      jsonDecode(text).forEach((element) {
        add(element);
      });
      print('thoughts lenght: '+_thoughts.length.toString());
      return true;
  }

  save() async{
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/thought.json');
    await file.writeAsString(jsonEncode(_thoughts));
    flashMessage('File has been writen');
    print('saved');
  }

  delete({ String text}) async{
    _thoughts.remove(text);
    print(_thoughts);
    await save();
    flashMessage(Constant.textQuoteDeleted);
  }

  deleteFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/thought.json');
    file.delete();
    flashMessage('File deleted!');
  }

  flashMessage(String message){
    Scaffold.of(this.context).showSnackBar(SnackBar(content: Text(message)));
  }

  flashMessageGeneric(String message, BuildContext con){
    Scaffold.of(con).showSnackBar(SnackBar(content: Text(message)));
  }
}