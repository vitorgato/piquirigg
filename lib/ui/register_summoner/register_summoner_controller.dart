import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piquirigg/core/models/summoner.model.dart';
import 'package:piquirigg/core/repositories/summoner_repository.dart';
import 'package:piquirigg/core/shared/utils/enums.dart';
import 'package:piquirigg/core/shared/utils/utils.dart';

class RegisterSummonerController extends GetxController {
  //repositories
  final SummonerRepository _summonerRepository = SummonerRepository();

  //variables
  TextEditingController summonerNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String? position;

  register() {
    if (checkObrigatoryFields()) {
      _summonerRepository.registerSummoner(Summoner(
          summonerName: summonerNameController.text,
          password: int.parse(passwordController.text),
          note: noteController.text,
          position: position));

      Get.back();
    }
  }

  setPosition(p) {
    position = p;
  }

  bool checkObrigatoryFields() {
    if (summonerNameController.text.isEmpty) {
      Utils().customSnackBar("Erro", "Por favor, Informe seu Nickname");
      return false;
    }
    if (position == null) {
      Utils().customSnackBar("Erro", "Por favor, Informe sua Posição");
      return false;
    }
    if (passwordController.text.isEmpty) {
      Utils().customSnackBar("Erro", "Por favor, Informe sua Senha");
      return false;
    }

    return true;
  }
}
