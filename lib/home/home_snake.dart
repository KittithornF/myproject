import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSnake extends StatelessWidget {
  static const routeName = '/homesnake';

  const HomeSnake({Key? key}) : super(key: key);

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
              Icon(Icons.arrow_forward_ios,color: Colors.black,),

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
                    'Snake_Game',
                    style: GoogleFonts.pressStart2p(
                        fontSize: 55, color: Colors.pinkAccent),
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
                      Navigator.pushReplacementNamed(context, '/snake');
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
