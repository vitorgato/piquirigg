import "package:flutter/material.dart";
import 'package:piquirigg/core/models/summoner.model.dart';
import 'package:piquirigg/ui/home/components/widgets/summoner_item.widget.dart';

class SummonerList extends StatelessWidget {
  List<Summoner> list = [];
  SummonerList({Key? key, list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SummonerItem(Summoner()));
          }),
    );
  }
}
