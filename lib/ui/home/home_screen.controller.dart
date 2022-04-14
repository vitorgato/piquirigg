import 'package:get/get.dart';
import 'package:piquirigg/core/models/summoner.model.dart';

class HomeScreenController extends GetxController {
  List<Summoner> summoners = [];

  getSummoners() {
    print("LENGTH ==>> ${summoners.length}");
  }
}
