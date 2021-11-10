import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSnake extends StatelessWidget {
  static const routeName = '/homesnake';

  const HomeSnake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var score = ModalRoute.of(context)!.settings.arguments as int?;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.shrink(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Snake_Game',
                    style: GoogleFonts.pressStart2p(
                        fontSize: 60, color: Colors.pinkAccent),
                  ),
                  Text(
                    score == null ? 'SCORE: 0' : 'SCORE: $score',
                    style:
                    GoogleFonts.pressStart2p(fontSize: 25, color: Colors.white),
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
                        'NEW GAME',
                        style: GoogleFonts.pressStart2p(
                            fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),

                ],
              ),
              Icon(Icons.arrow_forward_ios,size: 60,color: Colors.grey,),
            ],
          ),
        ),
      ),
    );
  }
}
