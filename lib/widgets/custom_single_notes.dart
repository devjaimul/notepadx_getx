import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepadx/controller/notes_controller.dart';
import 'package:notepadx/routes/routes_names.dart';
import 'package:notepadx/utils/colors.dart';
import 'package:notepadx/widgets/custom_text_style.dart';

class CustomSingleNotes extends StatelessWidget {
  final int index;
  const CustomSingleNotes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    final note = controller.notes.elementAt(index);
    final createdDateFormat = DateFormat.MMMEd().format(DateTime.now());
    final updatedDateFormat = DateFormat.jm().format(DateTime.now());
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.noteScreen, arguments: {
          'isUpdated': true,
          'note': note,
          'index': index,
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withOpacity(0.2)),
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            height: 13,
            width: 13,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backGroundColor,
            ),
          ),
          title: HeadingTwo(data: note.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingThree(data: note.description),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingThree(
                    data: '$createdDateFormat - $updatedDateFormat',
                    fontSize: 13,
                  ),
                  InkWell(
                      onTap: () {
                        controller.deleteNotes(index);
                        Get.snackbar('Deleted',
                            '${note.title} data deleted Successfully');
                      },
                      child: const Icon(Icons.delete))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
