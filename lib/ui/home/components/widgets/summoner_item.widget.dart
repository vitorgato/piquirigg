import 'package:flutter/material.dart';
import 'package:piquirigg/models/summoner.model.dart';

class SummonerItem extends StatelessWidget {
  final Summoner summoner;

  SummonerItem(this.summoner);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
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
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _planetValue({String value = "", String image = ""}) {
      return Row(children: <Widget>[
        // new Image.asset(image, height: 12.0),
        Container(width: 8.0),
        Text("gravity", style: regularTextStyle),
      ]);
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text("name", style: headerTextStyle),
          new Container(height: 10.0),
          new Text("location", style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: _planetValue(
                      value: "distance", image: 'assets/img/ic_distance.png')),
              new Expanded(
                  child: _planetValue(
                      value: "gravity", image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        // color: new Color(0xFF333366),
        color: Colors.grey[400],
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ));
  }
}