import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notepadx/controller/notes_controller.dart';
import 'package:notepadx/routes/routes_names.dart';

import 'package:notepadx/utils/colors.dart';
import 'package:notepadx/widgets/custom_single_notes.dart';

import '../widgets/custom_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    return Scaffold(
      body: Container(
        color: AppColors.backGroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Center(
                    child: HeadingTwo(
                  data: 'My Notes',
                  fontSize: 35,
                )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu)),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert_outlined)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Obx(
                    () => SingleChildScrollView(
                      child: Column(
                        children: [
                          controller.notes.isEmpty
                              ? const Center(
                                  child:
                                      HeadingThree(data: 'No Notes Available!'),
                                )
                              : ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: controller.notes.length,
                                  itemBuilder: (context, index) {

                                    return CustomSingleNotes(

                                      index: index,

                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteNames.noteScreen);
        },
        backgroundColor: Colors.black.withOpacity(0.8),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        //shape:  CircleBorder(),
      ),
    );
  }
}
