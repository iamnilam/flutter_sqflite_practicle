// import 'package:flutter/material.dart';
// import 'package:flutter_sqflite_practicle/sqflite/app_db.dart';
//
// class HomeDB extends StatefulWidget {
//   const HomeDB({super.key});
//
//   @override
//   State<HomeDB> createState() => _HomeDBState();
// }
//
// class _HomeDBState extends State<HomeDB> {
//   late AppDataBase appDB;
//   List<Map<String, dynamic>> data = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//      appDB = AppDataBase.instance;
//     getAllNotes();
//   }
//
//   void getAllNotes()async{
//    data = await appDB.fetchNotes();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("SQFLITE DATABASE"),
//       ),
//       body: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (_,index){
//           return ListTile(
//             title: Text("${data[index][AppDataBase.NOTE_TITLE]}"),
//             subtitle: Text("${data[index][AppDataBase.NOTE_DESC]}"),
//           );
//
//         },
//
//       ),
//       floatingActionButton:FloatingActionButton(
//         onPressed: (){
//          var appDB = AppDataBase.instance;
//          appDB.addNote("new note", "dfgdgdg");
//          getAllNotes();
//         },
//         child: Icon(Icons.add),
//       )
//     );
//   }
// }
