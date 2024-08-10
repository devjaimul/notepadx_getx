import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepadx/Models/model.dart';
import 'package:notepadx/controller/notes_controller.dart';
import 'package:notepadx/utils/colors.dart';
import 'package:notepadx/widgets/custom_text_style.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    final arg = Get.arguments != null
        ? Get.arguments as Map
        : {'isUpdated': false, 'note': null};
    final bool isUpdated = arg['isUpdated'] ?? false;
    final note = arg['note'] == null ? null : arg['note'] as NotesModels;
    final int? index = arg['index'] == null ? null : arg['index'] as int;

    final titleController =
        TextEditingController(text: isUpdated ? note!.title : null);
    final descriptionController =
        TextEditingController(text: isUpdated ? note!.description : null);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1), child: Divider()),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.done,
              cursorColor: AppColors.secondaryColor,
              minLines: 1,
              maxLines: 2,
              style: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  hintText: 'Title', border: InputBorder.none),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                cursorColor: AppColors.secondaryColor,
                maxLines: 50,
                textInputAction: TextInputAction.newline,
                decoration: const InputDecoration(
                    hintText: 'Description', border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            if (titleController.text.isEmpty ||
                descriptionController.text.isEmpty) {
              Get.snackbar('Error', 'Title & Description is Required');
            } else {
              isUpdated
                  ? controller.updateNote(index!, NotesModels(
                  title: titleController.text,
                  description: descriptionController.text,
                  createdtime: note!.createdtime,
                  updatedtime: DateTime.now().toString()
              ))
                  : controller.addNotes(NotesModels(
                      title: titleController.text,
                      description: descriptionController.text,
                      createdtime: DateTime.now().toString()));
              Get.back();
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.black.withOpacity(0.9),
          ),
          child: const HeadingTwo(
            data: 'Save Changes',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
