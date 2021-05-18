import 'dart:async';
import 'dart:ui';
import 'Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thought_keeper/Thoughts.dart';


class Thought extends StatefulWidget{
  final String title = 'Write your thought';
  Thoughts thoughts;
  Thought({Key key, @required this.thoughts}) : super(key: key);

  @override
  _ThoughtState createState() => _ThoughtState();
}

class _ThoughtState extends State<Thought>{

  TextEditingController textController = new TextEditingController();
  Thoughts _thoughts = null;
  String message = "";

  _clearTheMessage(){
    var timer = new Timer(const Duration(milliseconds: 5000), (){
      setState(() {
        message = "";
      });
    });
  }

  _saveText(){
      if(textController.text.length <= 0){
        setState(() {
          message = "Type something to save it";
        });
        _clearTheMessage();
        // _thoughts.flashMessageGeneric('Type something to save it',scaffoldKey.currentContext);
         return;
      }
      _thoughts.add(textController.text);
      _thoughts.save();
      textController.text = "";
      setState(() {
        message = "Quote saved!";
      });
      Navigator.pop(context, _thoughts);

  }

  @override
  Widget build(BuildContext context) {
    _thoughts = widget.thoughts;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  message,
                  textAlign: TextAlign.left,
                  style: Constant.textStyle2
              )
            ),
            Expanded(
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'The way to get started is to quit talking and begin doing'
                ),
                maxLines: 8,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => _saveText(),
                      child: Text('Save', style: Constant.textStyle),
                      style: Constant.flatButtonStyle
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Cancel', style: Constant.textStyle),
                      style: Constant.flatButtonStyle
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}