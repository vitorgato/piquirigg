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
  String? role;

  register() async {
    if (checkObrigatoryFields()) {
      if (role == null || role!.isEmpty) {
        role = "Procurando um duo.";
      }
      bool isValid = await _summonerRepository.registerSummoner(Summoner(
          summonerName: summonerNameController.text,
          password: passwordController.text,
          note: noteController.text,
          role: role));

      if (isValid) {
        Get.back();
      } else {
        Utils().customSnackBar("Erro", "Nickname não encontrado");
      }
    }
  }

  setPosition(r) {
    role = r;
  }

  bool checkObrigatoryFields() {
    if (summonerNameController.text.isEmpty) {
      Utils().customSnackBar("Erro", "Por favor, Informe seu Nickname");
      return false;
    }
    if (role == null) {
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
