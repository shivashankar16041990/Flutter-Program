import 'package:flutter/material.dart';
import 'package:myapp3/app_screen/NoteList.dart';
import 'package:myapp3/app_screen/NotesDetails.dart';
import 'dart:async';
import 'package:myapp3/Note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp3/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatefulWidget
{
  NoteDetails(this.note,this.apptitle);
  late final   apptitle;
  late final Note note;

  @override
  State<StatefulWidget> createState() {
 return NoteDetails_State(this.note,this.apptitle);
 }


}

class NoteDetails_State extends State<NoteDetails>
{
  DatabaseHelper helper=DatabaseHelper();
Note note;
  late String apptitle;
  NoteDetails_State(this.note,this.apptitle);
TextEditingController title_Controller=TextEditingController();
TextEditingController details_Controller=TextEditingController();
  static var priorities=["High","Low"];

  @override
  Widget build(BuildContext context) {
    title_Controller.text=note.title;
    details_Controller.text=note.description;
    return WillPopScope(onWillPop:()async{Navigator.pop(context);
    return true;},child:Scaffold(
        appBar: AppBar(
            leading: IconButton(icon:
               Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
            title:Text( this.apptitle)),
        body:Padding(
            padding:const EdgeInsets.only(
                top:15,left: 10,right: 10),
    child:ListView(
        children:[
          ListTile(
            title: DropdownButton(
              items: priorities.map((String dropdownitem){
                return
                    DropdownMenuItem(child: Text(dropdownitem),value:dropdownitem);

              }).toList(),
              style:Theme.of(context).textTheme.subtitle1 ,value:() {
              if (note.prioprity == 1) {
                return "High";
              }
              else
                return "Low";
            },
            onChanged:(valueselected){


                setState((){
                  debugPrint("user selected value");
                  if(valueselected=="High")
                    {
                      note.prioprity=1;

                    }
                  else
                    {
                      note.prioprity=2;
                    }
                });} ,

            ),

          ),

        TextField(
          decoration: InputDecoration(
              labelText: "Title",
              labelStyle:Theme.of(context).textTheme.subtitle1,
              border:OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))

          ),

          onChanged: (value ){updateTitle(); },
          controller:title_Controller ,style: Theme.of(context).textTheme.subtitle1,
        ),
          Padding(padding:const EdgeInsets.only(top: 15.0,bottom: 15.0),
                child:
          TextField(maxLines:4,

            decoration: InputDecoration(
                labelText: "Details",
                labelStyle:Theme.of(context).textTheme.subtitle1,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))

            ),

            onChanged: (value ){updateDescription(); },
            controller:details_Controller ,style: Theme.of(context).textTheme.subtitle1,
          )),
          Padding(padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
          child:Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(100.0),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>
                        (RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0)))),
                    child:const  Text("Save"),
                    onPressed: (){_save();}
                  ),),
              Container(width: 8.0),
              Expanded(child: ElevatedButton(style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(100.0),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>
                    (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0)))),child: const  Text("Delete"),onPressed: (){_delete();}
              ),)

            ],



    )
          )

        ]




    )
    )
    ));

  }

  void updateTitle(){
    note.title=title_Controller.text;
      }
    void updateDescription() {
      note.description = details_Controller.text;
    }
    void _save() async{
      moveToLastScreen();
      note.date=DateFormat.yMMMd().format(DateTime.now());
      int result;
      if(note.id!=null){
        result=await helper.updateNote(note);
      }
      else {
        result=await helper.insertNote(note);
      }

      if(result!=0)
        {
          _showAlertDialog('Status','Note Saved Successfully');
        }
      else {
        _showAlertDialog('Status','Problm in Saving Note');

      }

      }
      void _showAlertDialog(String title,String message)
      {
        AlertDialog alertdialog=AlertDialog(title: Text(title),
          content: Text(message));
        showDialog(context: context, builder:(_)=>alertdialog);
      }


      void _delete()async{
        moveToLastScreen();
    //case 1
        if(note.id==null){
          _showAlertDialog("status", "No Note was Deleted");

                        return;        }
    int result=await helper.deleteNote(note.id);
        if (result!=0)
          {
            _showAlertDialog("status", "Note deleted Successfully");

          }
        else{
          _showAlertDialog("status","Error occured while deleting");
        }

      }
      void moveToLastScreen(){
    Navigator.pop(context,true);
      }
}