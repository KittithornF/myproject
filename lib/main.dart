import 'package:flutter/material.dart';
import 'package:myproject/game/tictactoe.dart';
import 'package:myproject/home/iggo.dart';

import 'game/snake_game.dart';
import 'home/home.dart';
import 'home/home_snake.dart';
import 'home/home_tictactoe.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      routes: {
        HomeSnake.routeName: (context) => const HomeSnake(),
        SnakeGame.routeName: (context) => const SnakeGame(),
        TicTacToeHome.routeName: (context) => const TicTacToeHome(),
        HomePage.routeName: (context) => const HomePage(),
        TttGame.routeName: (context) => const TttGame(),
        IggOHome.routeName: (context) => const IggOHome(),

      },
      initialRoute: '/iggo',
    );
  }
}


