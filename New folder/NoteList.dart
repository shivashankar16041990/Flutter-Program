import 'package:flutter/material.dart';
import 'package:myapp3/app_screen/NoteList.dart';
import 'package:myapp3/app_screen/NotesDetails.dart';
import 'dart:async';
import 'package:myapp3/Note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp3/database_helper.dart';

class NoteList extends StatefulWidget {
  const NoteList();

  @override
  State<StatefulWidget> createState() {
    return NoteList_State();
  }
}

class NoteList_State extends State<NoteList> {
  DatabaseHelper databasehelper = DatabaseHelper();
  late List<Note> notelist;
  int itemcount = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle? textstyle = Theme.of(context).textTheme.subtitle1;
    int itemcount = 0;
    if(notelist==null){
      notelist=List<Note>.empty();
      updateListView();
    }




    return Scaffold(
        appBar: AppBar(title: const Text("Notes")),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            debugPrint("FAB is clicked");
            navigateToDetails   (Note(' ','',2),"Add Note");

          },
        ),
        body: ListView.builder(
            itemCount: itemcount,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: Colors.white,
                  elevation: 2.00,
                  child: ListTile(
                      leading:  CircleAvatar(
                          backgroundColor: getPriorityColor(this.notelist[index].prioprity),
                          child: getPriorityIcon(this.notelist[index].prioprity)),
                      title: Text(this.notelist[index].title
                        ,
                        style: textstyle,
                      ),
                      subtitle:  Text(this.notelist[index].date),
                      trailing: GestureDetector(child: Icon(Icons.delete),onTap: (){
                          _delete(context,notelist[index]);


                      }),
                      onTap:( () {
                        navigateToDetails(this.notelist[index],"Edit Note");

                        debugPrint("listitem is clicked");
                      })
                  )
              );}
              )
              );

  }

  Color getPriorityColor(int priority){
    switch(priority) {
      case 1:
        return Colors.red;
        break;
      case 2 :
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;

    }
    }

    Icon getPriorityIcon(int priority)
    {

      switch(priority) {
        case 1:
          return Icon(Icons.play_arrow);
          break;
        case 2 :
          return Icon(Icons.keyboard_arrow_right);
          break;
        default:
          return Icon(Icons.keyboard_arrow_right);

     }}

  void _delete(BuildContext context,Note note) async
      {
        int result=await databasehelper.deleteNote(note.id);
        if(result!=0)
          {
            _showSnackBar(context,"Note Deleted Successfully");
            updateListView();
      }
        
      }

  void _showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),))
;
  }
  void  updateListView(){


    final Future<Database> dbFuture=databasehelper.initializedatabase();
    dbFuture.then((database) {

      Future<List<Note>> noteListFuture=databasehelper.getNoteList();
      noteListFuture.then((notelist) {
        this.notelist=notelist;
        this.itemcount=notelist.length;

      });
      
    });
  }
void navigateToDetails(Note note,String title)async{

  bool result=await Navigator.push(context, MaterialPageRoute(builder: (context) {
    return NoteDetails(note,title);
  }));
  if(result ==true){
    updateListView();
  }
}

}
