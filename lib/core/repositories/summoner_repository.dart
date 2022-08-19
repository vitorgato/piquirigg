import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:piquirigg/core/models/summoner.model.dart';

class SummonerRepository {
  Stream<List<Summoner>> getAllSummoners() {
    return FirebaseFirestore.instance.collection("summoners").snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => Summoner.fromJson(e.data())).toList());
  }

  Future<bool> registerSummoner(Summoner summoner) async {
    print(summoner.toJson().toString());

    final docSummoner = FirebaseFirestore.instance
        .collection("summoners")
        .doc(summoner.summonerName);

    final json = {
      'summonerName': summoner.summonerName,
      'note': summoner.note,
      'password': summoner.password,
      'role': summoner.role,
      'rank': summoner.rank
    };

    await docSummoner.set(json);

    return true;
  }
}
