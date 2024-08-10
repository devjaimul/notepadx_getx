import 'package:get/get.dart';
import 'package:notepadx/Models/model.dart';

class NotesController extends GetxController {
  RxList<NotesModels> notes = <NotesModels>[].obs;

  addNotes(NotesModels notesData) {
    notes.add(notesData);
    update();
  }
  deleteNotes(int index){
    notes.removeAt(index);
    update();
  }
  updateNote(int index,NotesModels notesData){
    notes[index]=notesData;
    update();
  }


}
