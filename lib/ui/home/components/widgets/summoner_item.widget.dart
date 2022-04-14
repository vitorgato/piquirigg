import 'package:flutter/material.dart';
import 'package:piquirigg/core/models/summoner.model.dart';

class SummonerItem extends StatelessWidget {
  final Summoner summoner;

  SummonerItem(this.summoner);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: ClipOval(
        child: Image(
          image: NetworkImage(
              "https://opgg-static.akamaized.net/images/profile_icons/profileIcon5076.jpg"),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: Colors.grey[800], fontSize: 12.0, fontWeight: FontWeight.bold);
    final subHeaderTextStyle =
        regularTextStyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.bold);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.grey[800], fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _cardSubText({String text = "", String image = ""}) {
      return Row(children: <Widget>[
        // new Image.asset(image, height: 12.0),
        Container(width: 8.0),
        Text(text, style: regularTextStyle),
      ]);
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text("vitorgato", style: headerTextStyle),
          Container(height: 10.0),
          Text("Procurando DUO, discord.gg/vitorgato",
              maxLines: 1, style: subHeaderTextStyle),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Color(0xff00c6ff)),
          Row(
            children: <Widget>[
              Expanded(
                  child: _cardSubText(
                      text: "MID", image: 'assets/img/ic_distance.png')),
              Expanded(
                  child: _cardSubText(
                      text: "Diamante 3", image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        // color: new Color(0xFF333366),
        color: Color.fromARGB(255, 206, 205, 205),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }
}
