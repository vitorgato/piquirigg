// To parse this JSON data, do
//
//     final summoner = summonerFromJson(jsonString);

import 'dart:convert';

Summoner summonerFromJson(String str) => Summoner.fromJson(json.decode(str));

String summonerToJson(Summoner data) => json.encode(data.toJson());

class Summoner {
  Summoner({
    this.summonerName,
    this.summonerId,
    this.rankName,
    this.note,
    this.position,
    this.mic,
    this.password,
  });

  String? summonerName;
  String? summonerId;
  String? rankName;
  String? note;
  String? position;
  bool? mic;
  int? password;

  factory Summoner.fromJson(Map<String, dynamic> json) => Summoner(
        summonerName: json["summonerName"],
        summonerId: json["summonerId"],
        rankName: json["rankName"],
        note: json["note"],
        position: json["position"],
        mic: json["mic"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "summonerName": summonerName,
        "summonerId": summonerId,
        "rankName": rankName,
        "note": note,
        "position": position,
        "mic": mic,
        "password": password,
      };
}
