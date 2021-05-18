import 'package:flutter/material.dart';
import 'package:thought_keeper/Thought.dart';
import 'package:thought_keeper/Thoughts.dart';
import 'Constant.dart';
import 'CardC.dart';

class HomePage extends StatefulWidget {

  final String title = "Thoughts collection";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Thoughts _thoughts;
  List<Widget> w = new List<Widget>();
  bool firstTime = true;
  int _currentIndex = 0;

  Widget childElement = null;

  _buildList(){
    w = new List<Widget>();
    _thoughts.getThoughts().forEach((element){
      addContainerQuote(element);
    });


    setState(() {
      childElement = ListView(
          children: w
      );
    });
  }

  addContainerQuote(text){
      w.add(new CardC(text: text));
  }

  _openAddScreen() async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Thought(thoughts: _thoughts)
      ),
    );
    print(result);
    if(result != null) {
      setState(() {
        _thoughts = result;
      });
    }
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(firstTime){
      _thoughts = new Thoughts(context);
      _thoughts.read().then((var status){
        _buildList();
      });
      // _thoughts.deleteFile();
      firstTime = false;
    }
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.list_outlined),
        label: 'List',
      ),
      BottomNavigationBarItem(
          icon: const Icon(Icons.add_circle_outline_outlined),
          label: 'Add'
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.refresh_outlined),
        label: 'Refresh',
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: childElement
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: textTheme.caption.fontSize,
        unselectedFontSize: textTheme.caption.fontSize,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if(index == 1){
            _openAddScreen();
          }else if(index == 2){
            _thoughts.read().then((var status){
              print(_thoughts.getThoughts());
              _buildList();
              _thoughts.flashMessage('Refreshed');
            });
          }

        },
        selectedItemColor: Constant.textColor,
        unselectedItemColor: Constant.textColor.withOpacity(0.38),
        backgroundColor: Constant.background,
      ),
    );
  }
}
