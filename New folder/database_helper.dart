import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:myapp3/Note.dart';
class DatabaseHelper
{
  static late  DatabaseHelper _databasehelper; //static instance
  static late Database _database;//static instance
  String notetable="note_table";
  String colid="id";
  String coltitle="title";
  String coldescription='description';
  String colpriority='priority';
  String coldate='date';
  DatabaseHelper._createinstance();
  factory DatabaseHelper(){


    if(_databasehelper==null){
      _databasehelper=DatabaseHelper._createinstance();
    }
    return _databasehelper;
  }
  Future<Database> get database async
  {
    if(_database!=null)
    {
      _database=await initializedatabase();
    }
    return _database;
  }


  Future<Database> initializedatabase () async{

    Directory directory =await getApplicationDocumentsDirectory();
    String path=directory.path+"notes.db";
    Database notesdatabase =await openDatabase(path,version:1,onCreate: _createDb);
    return notesdatabase;

  }


  void _createDb(Database db,int newversion)async{
    await db.execute('create table $notetable ($colid integer primary key autoincrement,$coltitle text,'
        '$coldescription text,$colpriority integer,$coldate text)');
  }
  Future <List<Map<String,dynamic>>>getNoteMapList()async{
    Database db=await this.database;
    //var result=await db.rawQuery("select * from $notetable orderby $colpriority asc");

    var result=await db.query(notetable,orderBy: '$colpriority asc');
    return result;

  }
  Future <int>  insertNote(Note note)async{
    Database db=await this.database;
    var result=await db.insert(notetable, note.toMap());
    return result;
  }
  Future <int>  updateNote(Note note)async{
    var db=await this.database;
    var result=await db.update(notetable, note.toMap(),where: '$colid=?',whereArgs:[note.id]);
    return result;
  }
  Future <int>  deleteNote(int id)async{
    var db=await this.database;
    var result=await db.rawDelete("delete from $notetable where $colid =$id");
    return result;
  }
  Future <int>  getCount()async{
    var db=await this.database;
    List<Map<String,dynamic>> x=await db.rawQuery("select count (*) from $notetable");
    var result=Sqflite.firstIntValue(x);
    if (result !=null)
      return result;
    else
      return 0;
  }

Future <List<Note>>  getNoteList() async{
    var noteMapList= await getNoteMapList();
    var noteList=List<Note> .empty();
    noteMapList.forEach((element)
    {noteList.add(Note.fromMaptobject(
        (element)
    )
    );
    }
    );
    return noteList;
}


}