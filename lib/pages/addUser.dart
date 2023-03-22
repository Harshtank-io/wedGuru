// import 'package:flutter/material.dart';
// import 'package:like_button/like_button.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:wed_guru/model/persons.dart';
// import 'package:wed_guru/model/pmodel.dart';
// import 'package:wed_guru/pages/home.dart';
// import 'package:wed_guru/pages/personDetail.dart';
// import 'package:wed_guru/util/databasehelper.dart';
//
// class UserAdd extends StatefulWidget {
//   const UserAdd({Key? key}) : super(key: key);
//
//   @override
//   State<UserAdd> createState() => _UserAddState();
// }
//
// class _UserAddState extends State<UserAdd> {
//   int? selectedId;
//   final textController = TextEditingController();
//
//   // Like button variable
//   final List<bool> _likes = List.filled(3,true);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white70,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: AppBar(
//           backgroundColor: Colors.blue,
//           centerTitle: true,
//           title: TextField(
//             decoration:  InputDecoration(
//                 border: InputBorder.none,
//                 hintText: ' Add Here',
//               hintStyle: GoogleFonts.poppins(
//                   fontSize: 20.0, color: Colors.white
//               ),
//             ),
//             controller: textController,
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.person_add_alt_1),
//             onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())); },
//             tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//           ),
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(25)
//               )
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.white70,
//             // decoration: const BoxDecoration(
//             //   gradient: LinearGradient(
//             //       begin: Alignment.topCenter,
//             //       end: Alignment.bottomCenter,
//             //       colors: [Color.fromRGBO(97, 0, 255, 1), Color.fromRGBO(235, 92, 195, 1)]),
//             // ),
//             child: Center(
//
//               child: FutureBuilder<List<Persons>>(
//                   future: DatabaseHelper.instance.getPersons(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<List<Persons>> snapshot) {
//                     if (!snapshot.hasData) {
//                       return Center(child: Text('Loading...'));
//                     }
//                     return snapshot.data!.isEmpty
//                         ? Center(child: Text('No Persons in List.'))
//                         : ListView(
//                       children: snapshot.data!.map((persons) {
//                         return Center(
//                           child: Card(
//                             semanticContainer: true,
//                             elevation: 5,
//                             color: selectedId == persons.id
//                                 ? Colors.pinkAccent[700]
//                                 : Colors.pinkAccent[200],
//                             child: Container(
//                               height: 120,
//                               alignment: Alignment.center,
//                               child: ListTile(
//                                 leading:  const CircleAvatar(
//                                   backgroundImage: AssetImage('lib/img/p4.jpg'),
//                                   radius:35,
//                                 ),
//                                 title: Text(persons.name,
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 26.0,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonDetail()));
//                                 } ,
//                                 //textColor: Colors.white,
//                                 visualDensity: VisualDensity(vertical: 3,),
//                                 trailing: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     LikeButton(
//                                       likeBuilder: (bool isLiked) {
//                                         return Icon(
//                                           Icons.favorite,
//                                           color: isLiked ? Colors.blue : Colors.white,
//
//                                         );
//                                       },
//                                     ),
//                                     IconButton(
//                                       icon : Icon(Icons.edit),
//                                       onPressed: () {
//                                         setState(() {
//                                           if (selectedId == null) {
//                                             textController.text = persons.name;
//                                             selectedId = persons.id;
//                                           } else {
//                                             textController.text = '';
//                                             selectedId = null;
//                                           }
//                                         });
//                                       }),
//                                     IconButton(
//                                       icon : Icon(Icons.delete),
//                                       onPressed: () {
//                                         setState(() {
//                                       DatabaseHelper.instance.remove(persons.id!);
//                                     }); },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     );
//                   }),
//
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             shape:StadiumBorder(),
//         ),
//         child: Icon(Icons.add,),
//         onPressed: () async {
//           selectedId != null
//               ? await DatabaseHelper.instance.update(
//             Persons(id: selectedId, name: textController.text),
//           )
//               : await DatabaseHelper.instance.add(
//             Persons(name: textController.text),
//           );
//           setState(() {
//             textController.clear();
//             selectedId = null;
//           });
//         },
//       ),
//     );
//   }
// }
