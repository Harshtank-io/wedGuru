import 'package:flutter/material.dart';
import 'package:wed_guru/database/databasehelper.dart';
import 'package:wed_guru/model/pmodel.dart';
import 'package:wed_guru/pages/Localdb/showdetail.dart';
import 'package:wed_guru/pages/Localdb/edit.dart';
import 'package:wed_guru/pages/components/homeNavigation.dart';
import 'package:wed_guru/pages/Localdb/addUser.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final dbHelper = DatabaseProvider.db;
  List<User> userList = [];
  String filter = '';

  // int? get id  => null;

  @override
  void initState() {
    super.initState();
    _getUsers();
    // _deleteUser(id!);
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (val){
                setState(() {
                  filter = val.toLowerCase();
                });
              },
              decoration:InputDecoration(
                hintText: "search....",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                final user = userList[index];
                if(!user.name.toLowerCase().contains(filter)){
                  return Container();
                }
                return Container(
                  width: 70,
                  padding: const EdgeInsets.only(top: 18,bottom: 18 ),
                  margin: const EdgeInsets.only(top: 10 ,left: 10 ,right: 10),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: cardText(user: user),
                    ),
                    subtitle: Text(user.city,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17
                      ) ,
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditUser(user: user,)));
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteUser(user.id!);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => UserList()));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('User Deleted Successfully!!'),
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(user: user,)));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 100,
        child: FloatingActionButton(
          child: Icon(Icons.add,),
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            //navigate to add person page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddUser(),
              ),
            ).then((value) => _getUsers());
          },
        ),
      ),
    );
  }

  Future<void> _getUsers() async {
    final list = await dbHelper.getAllUsers();
    setState(() {
      userList = list;
    });
  }

  Future<void> _deleteUser(int id) async {
    final count = await dbHelper.delete(id);
    if (count > 0) {
      _deleteUser(id);
    }
  }
}

class cardText extends StatelessWidget {
  const cardText({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Text(user.name,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white
    ),
    );
  }
}
