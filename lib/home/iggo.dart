import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IggOHome extends StatelessWidget {
  static const routeName = '/iggo';
  const IggOHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          Text(
                            'IggO_GAMEs',
                            style: GoogleFonts.pressStart2p(
                              fontSize: 60,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3.5
                                ..color = Colors.pink,
                            ),
                          ),
                          Text(
                            'IggO_GAMEs',
                            style: GoogleFonts.pressStart2p(
                              fontSize: 60,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,

                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('_Play_',style: GoogleFonts.pressStart2p(color: Colors.pink,fontSize: 20),),
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
