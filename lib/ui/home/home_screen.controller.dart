import 'package:get/get.dart';
import 'package:piquirigg/core/models/summoner.model.dart';
import 'package:piquirigg/core/repositories/summoner_repository.dart';

class HomeScreenController extends GetxController {
  final SummonerRepository _summonerRepository = SummonerRepository();
  List<Summoner> summoners = [];

  // listAllSummoners() => _summonerRepository.getAllSummoners();

  getSummoners() {
    print("LENGTH ==>> ${summoners.length}");
  }
}
