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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_ios,color: Colors.black,),
              Stack(
                children: [
                  Text(
                    'IggO_GAMEs',
                    style: GoogleFonts.pressStart2p(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3.5
                        ..color = Colors.pink,
                    ),
                  ),
                  Text(
                    'IggO_GAMEs',
                    style: GoogleFonts.pressStart2p(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: [
                  Text(
                    'TIC_TAC_TOE',
                    style: GoogleFonts.pressStart2p(
                        fontSize: 55, color: Colors.pinkAccent),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      '* Two Player Only *',
                      style: GoogleFonts.pressStart2p(
                          fontSize: 12, color: Colors.yellow),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(width: 3, color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/tttgame');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'NEW_GAME',
                        style: GoogleFonts.pressStart2p(
                            fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
