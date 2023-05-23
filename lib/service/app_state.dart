import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum TypeState { token, emailUser, code, isFirstApp }

class AppState extends GetxController {
  static final AppState instance = AppState();
  final settingBox = GetStorage();
}
