import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TttGame extends StatefulWidget {
  static const routeName = '/tttgame';

  const TttGame({Key? key}) : super(key: key);

  @override
  _TttGameState createState() => _TttGameState();
}

class _TttGameState extends State<TttGame> {

  bool _playerXTurn = true;
  int _filledBoxes = 0;
  List<String> _xoList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
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
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      _playerXTurn? 'PLAYER X TURN':'PLAYER O TURN',
                      style: GoogleFonts.pressStart2p(color: Colors.white,fontSize: 30),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 7 / 9,
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () {
                              _tapp(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  _xoList[index],
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color:_xoList[index]=='X'? Colors.yellow:Colors.pinkAccent),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title,
                style:
                    GoogleFonts.pressStart2p(fontSize: 15, color: Colors.red)),
            content: Text(
              message,
              style: GoogleFonts.pressStart2p(fontSize: 15),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Close',
                  style: GoogleFonts.pressStart2p(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home',arguments: 1);
                },
              ),
            ],
          );
        });
  }

  void _tapp(int index) {
    setState(() {
      if (_playerXTurn && _xoList[index] == '') {
        _xoList[index] = 'X';
        _filledBoxes += 1;
      } else if (!_playerXTurn && _xoList[index] == '') {
        _xoList[index] = 'O';
        _filledBoxes += 1;
      }
      _playerXTurn = !_playerXTurn;
      _checkWin();
    });

  }

  void _checkWin() {
    // check first row
    if (_xoList[0] == _xoList[1] &&
        _xoList[0] == _xoList[2] &&
        _xoList[0] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[0]}');
      return;
    }

    // check second row
    if (_xoList[3] == _xoList[4] &&
        _xoList[3] == _xoList[5] &&
        _xoList[3] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[3]}');
      return;
    }

    // check third row
    if (_xoList[6] == _xoList[7] &&
        _xoList[6] == _xoList[8] &&
        _xoList[6] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[6]}');
      return;
    }

    // check first column
    if (_xoList[0] == _xoList[3] &&
        _xoList[0] == _xoList[6] &&
        _xoList[0] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[0]}');
      return;
    }

    // check second column
    if (_xoList[1] == _xoList[4] &&
        _xoList[1] == _xoList[7] &&
        _xoList[1] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[1]}');
      return;
    }

    // check third column
    if (_xoList[2] == _xoList[5] &&
        _xoList[2] == _xoList[8] &&
        _xoList[2] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[2]}');
      return;
    }

    // check diagonal
    if (_xoList[0] == _xoList[4] &&
        _xoList[0] == _xoList[8] &&
        _xoList[0] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[0]}');
      return;
    }

    // check diagonal
    if (_xoList[2] == _xoList[4] &&
        _xoList[2] == _xoList[6] &&
        _xoList[2] != '') {
      _showAlertDialog('GAME OVER', 'Winner is ${_xoList[2]}');
      return;
    }

    if (_filledBoxes == 9) {
      _showAlertDialog('GAME OVER', 'Draw');
    }
  }
}
