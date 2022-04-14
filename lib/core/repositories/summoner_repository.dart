import 'package:piquirigg/core/models/summoner.model.dart';

class SummonerRepository {
  bool registerSummoner(Summoner summoner) {
    print(summoner.toJson().toString());

    return true;
  }
}
