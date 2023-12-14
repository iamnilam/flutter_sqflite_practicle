import 'package:flutter_sqflite_practicle/sqflite_model/app_db_model.dart';

class NoteModel{
  int note_id;
  String note_title;
  String note_desc;

  NoteModel({required this.note_id, required this.note_title, required this.note_desc});

  //from map
factory NoteModel.fromMap(Map<String, dynamic> map){
  return NoteModel(
      note_id: map[AppDataBase.NOTE_ID],
      note_title: map[AppDataBase.NOTE_TITLE],
      note_desc: map[AppDataBase.NOTE_DESC]
  );
}

Map<String, dynamic> toMap(){
  return {
    AppDataBase.NOTE_TITLE : note_title,
    AppDataBase.NOTE_DESC : note_desc,
  };
}


//to map

}