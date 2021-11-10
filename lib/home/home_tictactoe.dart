import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicTacToeHome extends StatelessWidget {
  static const routeName = '/hometic';
  const TicTacToeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(Icons.arrow_back_ios,size: 60,color: Colors.grey,),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'TIC_TAC_TOE',
                    style: GoogleFonts.pressStart2p(
                        fontSize: 60, color: Colors.pinkAccent),
                  ),

                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(width: 3, color: Colors.red),
                    ),
                    onPressed: () {

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
              SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
