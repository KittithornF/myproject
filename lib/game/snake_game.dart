import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class SnakeGame extends StatefulWidget {
  static const routeName = '/snake';
  const SnakeGame({Key? key}) : super(key: key);

  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final int squaresPerRow = 20;
  final int squaresPerCol = 40;
  final fontStyle = GoogleFonts.pressStart2p(color: Colors.white, fontSize: 16);
  final randomGen = Random();
  var isPlaying = false;
  var snake = [
    [0, 1],
    [0, 0]
  ];
  var food = [0, 2];
  var direction = 'up';

  void startGame() {
    const duration = Duration(milliseconds: 300);

    snake = [
      // Snake head
      [(squaresPerRow / 2).floor(), (squaresPerCol / 2).floor()]
    ];

    snake.add([snake.first[0], snake.first[1] + 1]); // Snake body

    createFood();

    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void moveSnake() {
    setState(() {
      switch (direction) {
        case 'up':
          snake.insert(0, [snake.first[0], snake.first[1] - 1]);
          break;

        case 'down':
          snake.insert(0, [snake.first[0], snake.first[1] + 1]);
          break;

        case 'left':
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
          break;

        case 'right':
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
          break;
      }

      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  void createFood() {
    food = [randomGen.nextInt(squaresPerRow), randomGen.nextInt(squaresPerCol)];
  }

  bool checkGameOver() {
    if (!isPlaying ||
        snake.first[1] < 0 ||
        snake.first[1] >= squaresPerCol ||
        snake.first[0] < 0 ||
        snake.first[0] > squaresPerRow) {
      return true;
    }

    for (var i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }

    return false;
  }

  void endGame() {
    isPlaying = false;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('GAME OVER',
                style:
                    GoogleFonts.pressStart2p(fontSize: 20, color: Colors.red)),
            content: Text(
              'SCORE: ${snake.length - 2}',
              style: GoogleFonts.pressStart2p(fontSize: 15),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Close',
                  style: GoogleFonts.pressStart2p(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);

                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent.shade400,
          centerTitle: true,
          title: Stack(
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
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (direction != 'up' && details.delta.dy > 0) {
                        direction = 'down';
                      } else if (direction != 'down' && details.delta.dy < 0) {
                        direction = 'up';
                      }
                    },
                    onHorizontalDragUpdate: (details) {
                      if (direction != 'left' && details.delta.dx > 0) {
                        direction = 'right';
                      } else if (direction != 'right' && details.delta.dx < 0) {
                        direction = 'left';
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: squaresPerRow / (squaresPerCol + 2),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: squaresPerRow,
                        ),
                        itemCount: squaresPerRow * squaresPerCol,
                        itemBuilder: (BuildContext context, int index) {
                          var color;
                          var x = index % squaresPerRow;
                          var y = (index / squaresPerRow).floor();

                          bool isSnakeBody = false;
                          for (var pos in snake) {
                            if (pos[0] == x && pos[1] == y) {
                              isSnakeBody = true;
                              break;
                            }
                          }
                          if (snake.first[0] == x && snake.first[1] == y) {
                            color = Colors.greenAccent;
                          } else if (isSnakeBody) {
                            color = Colors.white;
                          } else if (food[0] == x && food[1] == y) {
                            color = Colors.red;
                          } else {
                            color = Colors.grey[800];
                          }
                          return Container(
                            margin: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (direction != 'right') {
                              direction = 'left';
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_left),
                        color: Colors.white,
                        iconSize: 40,
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (direction != 'down') {
                              direction = 'up';
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_drop_up),
                        color: Colors.white,
                        iconSize: 40,
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (direction != 'up') {
                              direction = 'down';
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down),
                        color: Colors.white,
                        iconSize: 40,
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (direction != 'left') {
                              direction = 'right';
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_right),
                        color: Colors.white,
                        iconSize: 40,
                        splashRadius: 20,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      Text(
                        'SCORE: ${snake.length - 2}',
                        style: fontStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startGame();
  }
}
