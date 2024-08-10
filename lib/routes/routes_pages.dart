import 'package:get/get.dart';
import 'package:notepadx/routes/routes_names.dart';
import 'package:notepadx/views/home_screen.dart';
import 'package:notepadx/views/note_screen.dart';

class RoutePages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: RouteNames.homeScreen, page: () => const HomeScreen()),
    GetPage(name: RouteNames.noteScreen, page: () => const NoteScreen()),
  ];
}
