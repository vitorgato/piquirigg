import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piquirigg/core/shared/utils/assets_postions.dart';
import 'package:piquirigg/core/shared/widgets/custom_textfield.dart';
import 'package:piquirigg/ui/register_summoner/register_summoner_controller.dart';
import 'package:piquirigg/ui/register_summoner/widgets/toggle_position.widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterSummonerScreen extends StatefulWidget {
  const RegisterSummonerScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSummonerScreen> createState() => _RegisterSummonerScreenState();
}

class _RegisterSummonerScreenState extends State<RegisterSummonerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RegisterSummonerController controller =
        Get.put(RegisterSummonerController());
    final size = MediaQuery.of(context).size;
    _customLabeled({child, label}) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.quicksand().copyWith(
                  fontWeight: FontWeight.bold, color: const Color(0xff232434)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: child,
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Registrar",
            style: GoogleFonts.montserrat().copyWith(color: Colors.grey[700]),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.grey,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _customLabeled(
                          label: "Nome do Summoner",
                          child: CustomTextField(
                            hintText: "Digite aqui",
                            controller: controller.summonerNameController,
                          )),
                      _customLabeled(
                        label: "Posição",
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              TogglePositionWidget(selectedPosition: (value) {
                                controller.setPosition(value);
                              }),
                              _customLabeled(
                                  label: "Microfone",
                                  child:
                                      Switch(value: false, onChanged: (v) {})),
                            ],
                          ),
                        ),
                      ),
                      _customLabeled(
                          label: "Nota",
                          child: CustomTextField(
                              maxLines: 8,
                              controller: controller.noteController,
                              hintText:
                                  "Procurando um duo, vamos jogar juntos!")),
                      _customLabeled(
                          label: "Senha para deletar",
                          child: CustomTextField(
                            hintText: "Digite aqui",
                            maxLength: 4,
                            obscure: true,
                            controller: controller.passwordController,
                            kType: TextInputType.number,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        controller.register();
                      },
                      child: Text(
                        "Cadastrar",
                        style: GoogleFonts.quicksand().copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 106, 164, 211))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
