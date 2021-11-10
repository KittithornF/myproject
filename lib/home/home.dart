import 'package:flutter/material.dart';

import 'home_snake.dart';
import 'home_tictactoe.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );
    final pageView = PageView(
      controller: controller,

      children: [
        HomeSnake(),
        TicTacToeHome(),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: pageView,
    );
  }
}
