import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:piquirigg/core/shared/widgets/custom_elevation.dart';
import 'package:piquirigg/core/shared/widgets/wave_shape.dart';
import 'package:piquirigg/ui/home/components/summoner_list.component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          Color(0xFF0BC6E3),
                          Color(0xFF0BC4E2),
                        ])),
                      ),
                    ),
                    Positioned(
                      top: 55,
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
              Container(
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: OutlinedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: () {},
                  child: Text(
                    "REGISTRE SEU SUMMONER",
                    style: GoogleFonts.montserrat().copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey[800]),
                  ),
                ),
              ),
              SummonerList()
            ],
          ),
        ),
      ),
    );
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
