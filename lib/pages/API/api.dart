import 'package:flutter/material.dart';
import 'package:wed_guru/pages/API/addPage.dart';
import 'package:wed_guru/pages/Localdb/userlist.dart';
import 'package:wed_guru/services/services.dart';
import 'package:wed_guru/widget/snackbar.dart';
import 'package:wed_guru/widget/todocard.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
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
            'Add',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => UserList()));
            },
          ),
        ),
      ),
      body: Visibility(
        visible: isLoading,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: const Center(
              child: Text(
                'No Data in API..',
                style: TextStyle(fontSize: 25),
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(4),
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                final id = item['_id'] as String;
                return TodoCard(
                    index: index,
                    item: item,
                    navigateEdit: navigateToEditPage,
                    deleteById: deleteById);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pinkAccent,
          onPressed: navigateToAddPage, label: const Text("ADD API")),
    );
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(builder: (context) => const AddApiPage());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> navigateToEditPage(Map item) async {
    final route =
    MaterialPageRoute(builder: (context) => AddApiPage(api: item));
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> deleteById(String id) async {
    // delete Id
    final isSuccess = await TodoServices.deleteById(id);
    if (isSuccess) {
      // Remove item from List
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      //Show Error
      showErrorMsg(context, msg: 'Deletion Failed');
    }
  }

  Future<void> fetchTodo() async {
    final response = await TodoServices.fetchTodo();
    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showErrorMsg(context, msg: 'Something Went to Wrong');
    }
    setState(() {
      isLoading = false;
    });
  }
}