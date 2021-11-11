import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToeHome extends StatelessWidget {
  static const routeName = '/hometic';
  const TicTacToeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent.shade400,
          centerTitle: true,
          title: Text('IggO GAME',style: GoogleFonts.pressStart2p(color: Colors.black),),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'TIC_TAC_TOE',
                          style: GoogleFonts.pressStart2p(
                              fontSize: 35, color: Colors.pinkAccent),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '*Two Player Only*',
                          style: GoogleFonts.pressStart2p(
                              fontSize: 10, color: Colors.yellow),
                        ),
                      ],
                    ),

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 3, color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/tttgame');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'NEW GAME',
                          style: GoogleFonts.pressStart2p(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 15,
              child: Icon(
                Icons.arrow_back_ios,
                size: 60,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
