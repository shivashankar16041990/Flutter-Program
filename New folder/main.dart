import 'package:flutter/material.dart';
import 'package:myapp3/app_screen/NoteList.dart';
import 'package:myapp3/app_screen/NotesDetails.dart';
import 'dart:async';
import 'package:myapp3/Note.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

void main()
{
  runApp( MaterialApp(
      title: "Notekeeper",
      home:NoteList()));



}

