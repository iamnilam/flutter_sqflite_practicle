import 'package:flutter_sqflite_practicle/sqflite_model/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  //private constructor (singleton)
  AppDataBase._();

  static final AppDataBase instance = AppDataBase._();

  Database? myDB;

  //tables name
  static final String NOTE_TABLE = "notes";
  //Column
  static final String NOTE_ID = "noteId";
  static final String NOTE_TITLE = "title";
  static final String NOTE_DESC = "desc";

  Future<Database> initDB() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(docDirectory.path, "noteDb.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      //create table
      db.execute(
          "create table $NOTE_TABLE ($NOTE_ID integer primary key autoincrement, $NOTE_TITLE text, $NOTE_DESC text )");
    });
  }

  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB =  await initDB();
      return myDB!;
    }
  }

  void addNote(NoteModel newNote)async{
   var db = await getDB();
   db.insert(NOTE_TABLE,
   newNote.toMap()
   );
  }

  Future<List<NoteModel>> fetchNotes() async{
    var db = await getDB();
    List<NoteModel> arrNotes = [];

    var data = await db.query(NOTE_TABLE);
    for(Map<String, dynamic> eachNote in data){
      var noteModel = NoteModel.fromMap(eachNote);
      arrNotes.add(noteModel);
    }

    return arrNotes;
  }
}
