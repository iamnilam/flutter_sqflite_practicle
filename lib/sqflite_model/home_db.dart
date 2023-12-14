import 'package:flutter/material.dart';
import 'package:flutter_sqflite_practicle/sqflite_model/app_db_model.dart';
import 'package:flutter_sqflite_practicle/sqflite_model/note_model.dart';

class HomeDBModel extends StatefulWidget {
  const HomeDBModel({super.key});

  @override
  State<HomeDBModel> createState() => _HomeDBModelState();
}

class _HomeDBModelState extends State<HomeDBModel> {
  late AppDataBase appDB;
  List<NoteModel> data = [];

  @override
  void initState() {
    // TODO: implement initState
     appDB = AppDataBase.instance;
    getAllNotes();
  }

  void getAllNotes()async{
   data = await appDB.fetchNotes();
   setState(() {

   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQFLITE DATABASE"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_,index){

          var crrData = data[index];

          return ListTile(
            leading: Text('${crrData.note_id}'),
            title: Text(crrData.note_title),
            subtitle: Text(crrData.note_desc),
          );

        },

      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
         var appDB = AppDataBase.instance;
         appDB.addNote(NoteModel(
             note_id: 0,
             note_title: "nilam",
             note_desc: "software Engineer")
         );
         getAllNotes();
        },
        child: Icon(Icons.add),
      )
    );
  }
}


// 8160889623
// alaing offirese hem
//
// aashish
// 9790998708
// congnig gud gaav
