class Summoner {
  String? summonerName;
  String? iconUrl;
  String? note;
  String? role;
  String? password;
  String? rank;

  Summoner(
      {this.summonerName,
      this.iconUrl,
      this.note,
      this.role,
      this.password,
      this.rank});

  Summoner.fromJson(dynamic json) {
    summonerName = json['summonerName'] ?? "N/A";
    iconUrl = json['iconUrl'] ?? "N/A";
    note = json['note'] ?? "N/A";
    role = json['role'] ?? "N/A";
    password = json['password'] ?? "N/A";
    rank = json['rank'] ?? "N/A";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summonerName'] = this.summonerName;
    data['iconUrl'] = this.iconUrl;
    data['note'] = this.note;
    data['role'] = this.role;
    data['password'] = this.password;
    data['rank'] = this.rank;
    return data;
  }
}
