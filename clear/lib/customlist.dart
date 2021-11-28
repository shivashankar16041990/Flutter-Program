import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;

class CustomList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomListState();
  }
}

class CustomListState extends State<CustomList> {
  late List<Widget> mylist = List.empty(growable: true);
  late List<String> dismissed = List.empty(growable: true);
  bool draged = false;
  String selecteddate = "pick a date and time";
  List<String> insetnewitem = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    mylist = [];
    if (insetnewitem.length != 0) {
      insetnewitem.forEach((element) {
        mylist.add(insertnewTile(context, element));
      });
    }
    mylist.add(PullDown());
    mylist.add(swipeto("left"));
    mylist.add(swipeto("right"));
    if (draged == false) {
      mylist.add(TapandHold(context));
    }
    mylist.add(Receiver(context));
    debugPrint("$draged");
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mylist.length,
        itemBuilder: (context, index) {
          return mylist[index];
        });
  }

  Widget swipeto(String direction) {
    return Dismissible(
      key: Key("swipe to left $direction"),
      child: ListTile(
        tileColor: direction.startsWith("r") ? Colors.redAccent : Colors.green,
        title: Text('Swipe to $direction'),
      ),
      background: Container(
        color: Colors.redAccent,
      ),
      onDismissed: (_) {
        direction.startsWith("r") ? mylist.removeAt(1) : mylist.removeAt(0);
      },
      direction: direction.startsWith("r")
          ? DismissDirection.startToEnd
          : DismissDirection.endToStart,
      confirmDismiss: (direction) => Future.value(true),
    );
  }

  Widget TapandHold(BuildContext context) {
    return Draggable<String>(
      data: 'Tap and hold to pick me up',
      childWhenDragging: Container(),
      child: Material(
        child: ListTile(
            tileColor: Colors.red, title: Text('Tap and hold to pick me up')),
      ),
      feedback: Material(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ListTile(
            tileColor: Colors.yellowAccent,
            title: Text('Tap and hold to pick me up',
                style: TextStyle(decoration: TextDecoration.lineThrough))),
      )),
    );
  }

  Widget Receiver(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DragTarget<String>(
            builder: (context, _, __) {
              if (dismissed.length == 0) {
                return Container(
                  height: 100,
                );
              }
              return Container(
                  width: 200,
                  height: 200,
                  child: ListView.builder(
                      itemCount: dismissed.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 60,
                            child: ListTile(
                              title: Text("${dismissed[index]}",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough)),
                            ));
                      }));
            },
            onAccept: (value) {
              debugPrint("from accept");
              draged = true;
              dismissed.add(value);
              setState(() {
                debugPrint("from restate");
              });
            },
            onWillAccept: _willAccept,
          ),
        ],
      ),
    );
  }

  bool _willAccept(String? value) {
    // return (value!=null && value%2==1);
    return true;
  }

/* void  _onAccept(BuildContext context, int value){
    //context.read<GameScore>().addPoints(1);
    if(value!=null && value%2==1){
      context.read<GameScore>().addPoints(1);
      showMessage(context,"Good , Point Increased");
    }
    else
    {
      context.read<GameScore>().addPoints(-1);
    }

  }*/
  Widget PullDown() {
    return GestureDetector(
      child: ListTile(
          tileColor: Colors.red,
          title: Text(
            'Pull Down to create a new item',
          )),
      onVerticalDragDown: (details) {
        debugPrint("vertical down drag detected");
        insetnewitem.add("new item");
        setState(() {});
      },
    );
  }

  Widget insertnewTile(BuildContext context, String message) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "edit it",
                disabledBorder: InputBorder.none,
              ),
              onEditingComplete: () {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                            "Clear would like to send you notification "),
                        content: const Text(
                            "Notification may include alerts,sound, and icon ,These can be configured in Settings"),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Dont Send")),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Send"))
                        ],
                      );
                    });
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
                child: GestureDetector(
              onTap: () => _showPicker(context),
              child: Container(
                height: 50,
                child: Text("$selecteddate"),
              ),
            ))
          ]),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final size = MediaQuery.of(context).size.height;
          final double panelheight = size == null ? 150 : size / 2.8;
          return SizedBox(
            height: panelheight,
            child: cupertino.CupertinoDatePicker(
              minimumYear: 1950,
              maximumYear: 2021,
              onDateTimeChanged: (selected) {
                debugPrint("${selected.toString()}");
                selecteddate = selected.toString();
              },
              initialDateTime: DateTime.now(),
              mode: cupertino.CupertinoDatePickerMode.date,
              // mode: cupertino.CupertinoDatePickerMode.dateAndTime ,
              // mode: cupertino.CupertinoDatePickerMode.time ,
              //  mode: cupertino.CupertinoDatePickerMode.values ,
            ),
          );
        });
  }
}
