import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piquirigg/core/models/summoner.model.dart';
import 'package:piquirigg/core/shared/widgets/custom_elevation.dart';
import 'package:piquirigg/core/shared/widgets/wave_shape.dart';
import 'package:piquirigg/ui/home/components/summoner_list.component.dart';
import 'package:piquirigg/ui/home/components/widgets/summoner_item.widget.dart';
import 'package:piquirigg/ui/home/home_screen.controller.dart';
import 'package:piquirigg/ui/register_summoner/register_summoner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenController controller;

  @override
  void initState() {
    controller = Get.put(HomeScreenController());

    super.initState();
  }

  // Stream<List<Summoner>> getAllSummoners() {
  //   return FirebaseFirestore.instance.collection("summoners").snapshots().map(
  //       (snapshot) =>
  //           snapshot.docs.map((e) => Summoner.fromJson(e.data())).toList());
  // }
  getAllSummoners(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs.map((doc) {
      Summoner summoner = Summoner.fromJson(doc.data());
      return Padding(
        padding: EdgeInsets.all(8),
        child: SummonerItem(summoner),
      );
    }).toList();
  }
  // Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: SummonerItem(Summoner()));
  //     })

  @override
  Widget build(BuildContext context) {
    print("build home");
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 165,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveShape(),
                      child: Container(
                        width: size.width,
                        height: 160,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 17, 214, 245),
                          Color(0xFF0BC4E2),
                          Color.fromARGB(255, 14, 81, 92),
                        ])),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.1,
                      left: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PIQUIRI.GG",
                              style: GoogleFonts.montserrat().copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800])),
                          Text("ENCONTRE O SEU DUO",
                              style: GoogleFonts.quicksand().copyWith(
                                  fontSize: 20, color: Colors.grey[600])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: OutlinedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: () {
                    Get.to(
                      () => RegisterSummonerScreen(),
                      transition: Transition.zoom,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 550),
                    );
                  },
                  child: Text(
                    "REGISTRE SEU SUMMONER",
                    style: GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey[800]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("summoners")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: Text("Nenhum jogador cadastrado"));
                      return ListView(children: getAllSummoners(snapshot));
                    }),
              ),
              // SummonerList(
              //   list: [1, 2],
              // )
              // StreamBuilder<List<Summoner>>(
              //   stream: getAllSummoners(),
              //   builder: ((context, snapshot) => {
              //     if(snapshot.hasError){
              //       return Center(child: Text("Lista vazia"));
              //     } else if(snapshot.hasData){
              //       return Text("");
              //     }else{
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }

              // }))
            ],
          ),
        ),
      ),
    );
    // Expanded(
    // child: ListView.builder(
    //     itemCount: controller.summoners.length,
    //     shrinkWrap: true,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: SummonerItem(Summoner()));
    //     }),
    //           );

    // return Material(
    //     child: Container(
    //   padding: const EdgeInsets.only(bottom: 12),
    //   child: Stack(
    //     children: [
    //       ClipPath(
    //         clipper: WaveShape(),
    //         child: Container(
    //           width: size.width,
    //           height: 160,
    //           decoration: const BoxDecoration(
    //               gradient: LinearGradient(colors: [
    //             Color(0xFF0BC6E3),
    //             Color(0xFF0BC4E2),
    //           ])),
    //         ),
    //       ),
    //       Positioned(
    //         top: 55,
    //         left: 5,
    //         child: Column(
    //           children: [
    //             Text("PIQUIRI.GG",
    //                 style: GoogleFonts.montserrat().copyWith(
    //                     fontSize: 40,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.grey[800])),
    //             Text("ENCONTRE O SEU DUO",
    //                 style: GoogleFonts.quicksand()
    //                     .copyWith(fontSize: 20, color: Colors.grey[600])),
    //           ],
    //         ),
    //       ),
    //       Positioned(
    //           top: 160,
    //           child: Container(
    //             padding: EdgeInsets.all(12),
    //             width: size.width,
    //             child: Column(
    //               children: [
    //                 Container(
    //                   width: size.width,
    //                   child: OutlinedButton(
    //                     style: ButtonStyle(
    //                         shape: MaterialStateProperty.all<
    //                                 RoundedRectangleBorder>(
    //                             RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(18.0),
    //                                 side: BorderSide(color: Colors.blue)))),
    //                     onPressed: () {},
    //                     child: Text(
    //                       "REGISTRE SEU SUMMONER",
    //                       style: GoogleFonts.montserrat().copyWith(
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.grey[800]),
    //                     ),
    //                   ),
    //                 ),
    //                 SummonerList()
    //               ],
    //             ),
    //           )),
    //     ],
    //   ),
    // ));
  }
}
