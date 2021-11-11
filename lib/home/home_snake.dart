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
          title: Text('IggO GAME',style: GoogleFonts.pressStart2p(color: Colors.black),),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Snake_Game',
                        style: GoogleFonts.pressStart2p(
                            fontSize: 35, color: Colors.pinkAccent),
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
                right: 0,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 60,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
