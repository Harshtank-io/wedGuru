import 'package:flutter/material.dart';
import 'package:wed_guru/model/pmodel.dart';
import 'package:wed_guru/pages/Localdb/userlist.dart';

class LikedUsers extends StatelessWidget {
  final List<User> userList;

  const LikedUsers({Key? key, required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likedUser = userList.where((user) => user.isliked).toList();
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25)
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            'List',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => UserList()));
            },
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: likedUser.length,
          itemBuilder: (BuildContext context , int index){
          final user = likedUser[index];

          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.gender),
          );
          }
      ),
    );
  }
}
