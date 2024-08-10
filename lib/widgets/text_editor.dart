import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
class TextEditor extends StatelessWidget {
  const TextEditor({super.key});
  @override
  Widget build(BuildContext context) {
    QuillController controller = QuillController.basic();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            QuillSimpleToolbar(
              controller: controller,
              configurations: const QuillSimpleToolbarConfigurations(),
            ),
            Expanded(
              child: QuillEditor.basic(
                controller: controller,
                configurations: const QuillEditorConfigurations(
                 // placeholder: 'Enter Your Text',
                  padding: EdgeInsets.all(8),



                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
