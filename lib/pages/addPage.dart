
import 'package:flutter/material.dart';
import 'package:wed_guru/services/services.dart';
import 'package:wed_guru/widget/snackbar.dart';

class AddApiPage extends StatefulWidget {
  final Map? api;
  const AddApiPage({Key? key, this.api}) : super(key: key);

  @override
  State<AddApiPage> createState() => _AddApiPageState();
}

class _AddApiPageState extends State<AddApiPage> {
  TextEditingController titleContoller = TextEditingController();
  TextEditingController descriptionContoller = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final api = widget.api;
    if (api != null) {
      isEdit = true;
      final title = api['title'];
      final description = api['description'];

      titleContoller.text = title;
      descriptionContoller.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: isEdit ? Text("Edit API") : Text("ADD API"),
        title: Text(
          isEdit ? 'Edit API' : 'Add API',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          TextField(
            controller: titleContoller,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: descriptionContoller,
            decoration: const InputDecoration(hintText: 'Description'),
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: isEdit ? updateData : submitData,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(isEdit ? 'Update' : 'Submite'),
            ),
          )
        ],
      ),
    );
  }

  Future<void> updateData() async {
    final api = widget.api;
    if (api == null) {
      print("You Can Not Update Without Api Data");
      return;
    }
    // 1. Update Data for Form...
    final id = api['_id'];

    // 2. Submit Updated Data to Server..
    final isSuccess = await TodoServices.updateTodo(id, body);
    // Print msg is Update or not to Server..
    if (isSuccess) {
      showSuccessMsg(context, msg: 'Update Success');
    } else {
      showErrorMsg(context, msg: 'Update is Failed');
    }
  }

  Future<void> submitData() async {
    // Submit Data to Server..
    final isSuccess = await TodoServices.addTodo(body);

    // Print msg is Send or Not to Server..
    if (isSuccess) {
      titleContoller.text = '';
      descriptionContoller.text = '';
      showSuccessMsg(context, msg: 'Sent Successful');
    } else {
      showErrorMsg(context, msg: 'Sent is Failed');
    }
  }

  Map get body{
    // get Data From form...

    final title = titleContoller.text;
    final description = descriptionContoller.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }
}