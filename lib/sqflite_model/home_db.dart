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

  var titleController = TextEditingController();
  var descController = TextEditingController();

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
        title: const Text("SQFLITE DATABASE"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_,index){

          var crrData = data[index];

          return ListTile(
            leading: Text('${crrData.note_id}'),
            title: Text(crrData.note_title),
            subtitle: Text(crrData.note_desc),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: (){
                        callMyBottomSheet(isUpdate: true,
                            noteId: crrData.note_id,
                            title: crrData.note_title, desc: crrData.note_desc);
                      },
                      child: Icon(Icons.edit,color: Colors.blue,)),
                  InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("Delete?"),
                            content: Text("Are you sure want to delete this Note???"),
                            actions: [
                              TextButton(onPressed: (){
                                //delete
                                appDB.deleteNote(crrData.note_id);
                                getAllNotes();
                                Navigator.pop(context);
                              }, child: Text("Yes")),
                              TextButton(onPressed: (){

                                Navigator.pop(context);
                              }, child: Text("No")),
                            ],
                          );
                        });
                      },
                      child: Icon(Icons.delete, color: Colors.red)),
                ],
              ),
            ),
          );

        },

      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          callMyBottomSheet();
        },
        child: const Icon(Icons.add),
      ),

    );
  }

  void callMyBottomSheet({bool isUpdate = false,int noteId = 0, String title = "", String desc = ""}){


      titleController.text = title;
      descController.text = desc;
      // else{
    //   titleController.text = "";
    //   descController.text = "";
    // }

    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isUpdate ? "Updated Note" : "Add Notes"),
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: descController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){
                  var appDB = AppDataBase.instance;
                  if(titleController.text.isNotEmpty && descController.text.isNotEmpty){
                    if(isUpdate){
                    appDB.updateNote(NoteModel(
                        note_id: noteId,
                        note_title:  titleController.text.toString(),
                        note_desc:  descController.text.toString())
                    );
                    }else{
                      appDB.addNote(NoteModel(
                          note_id: 0,
                          note_title: titleController.text.toString(),
                          note_desc: descController.text.toString())
                      );
                    }
                    getAllNotes();
                    Navigator.pop(context);}
                }, child:  Text(isUpdate ? "Updated":"Add")),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("Cancel")),

              ],
            )
          ],
        ),
      );
    });

  }
}


// 8160889623
// alaing offirese hem
//
// aashish
// 9790998708
// congnig gud gaav
