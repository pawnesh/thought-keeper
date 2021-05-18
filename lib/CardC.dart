
import 'package:flutter/material.dart';
import 'package:thought_keeper/Thoughts.dart';

import 'Constant.dart';

class CardC extends StatelessWidget{
  String text = "No text";
  CardC({Key key, this.text}) : super(key: key);
  Thoughts _thoughts;

  _deleteQuote(){
    _thoughts.read().then((var status){
      _thoughts.delete(text: text);
    });
  }

  @override
  Widget build(BuildContext context) {
    _thoughts = new Thoughts(context);

    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
          color: Constant.background,
        ),
        padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 30,
            bottom: 30
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left:  new BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  right:  new BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Constant.textColorQuote
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text('ThoughtKeeper')),
                  IconButton(
                      icon: Icon(Icons.delete_outline_outlined, color: Constant.textColor, size: 30) ,
                      onPressed: _deleteQuote
                  ),
                  // Image(image: AssetImage('assets/icons/thought.png'), width: 40,)
                ],
              ),
            )
          ],
        )
    );
  }

}