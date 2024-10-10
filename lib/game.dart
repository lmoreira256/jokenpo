import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/banner.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Color _color = Colors.white;
  String _message = "Escolha uma opção abaixo";
  AssetImage _image = const AssetImage('images/padrao.png');
  int _victoryCount = 0;
  int _defeatCount = 0;
  int _drawCount = 0;

  final String optionRock = 'pedra';
  final String optionPaper = 'papel';
  final String optionScissors = 'tesoura';

  final List<String> _options = [
    'pedra',
    'papel',
    'tesoura',
  ];

  final List<String> _finalMessage = [
    'Parabêns, você venceu!',
    'Você perdeu!',
    'Empatou!',
  ];

  final List<Color> _finalColor = [
    Colors.green,
    Colors.red,
    Colors.yellow,
  ];

  void _selectOption(String option) {
    int randonNumber = Random().nextInt(_options.length);
    String appOption = _options[randonNumber];

    int resultNumber = getResult(option, appOption);

    setState(() {
      _image = AssetImage('images/$appOption.png');
      _message = _finalMessage[resultNumber];
      _color = _finalColor[resultNumber];

      if (resultNumber == 0) {
        _victoryCount = ++_victoryCount;
      } else if (resultNumber == 1) {
        _defeatCount = ++_defeatCount;
      } else {
        _drawCount = ++_drawCount;
      }
    });
  }

  int getResult(String option, String appOption) {
    if (option == appOption) {
      return 2;
    }

    if ((option == optionRock && appOption == optionScissors) ||
        (option == optionScissors && appOption == optionPaper) ||
        (option == optionPaper && appOption == optionRock)) {
      return 0;
    }

    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JokenPo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: double.infinity,
              height: 130,
              color: _color,
              padding: const EdgeInsets.only(
                top: 35,
                bottom: 10,
              ),
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 32,
                bottom: 16,
              ),
              child: Text(
                'Escolha do app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(image: _image),
            const Padding(
              padding: EdgeInsets.only(
                top: 32,
                bottom: 16,
              ),
              child: Text(
                'Escolha do usuário',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _selectOption(_options[0]);
                  },
                  child: Image.asset('images/pedra.png', height: 95),
                ),
                GestureDetector(
                  onTap: () {
                    _selectOption(_options[1]);
                  },
                  child: Image.asset('images/papel.png', height: 95),
                ),
                GestureDetector(
                  onTap: () {
                    _selectOption(_options[2]);
                  },
                  child: Image.asset('images/tesoura.png', height: 95),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                'Vitórias: ${_victoryCount.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 16),
              child: Text(
                'Derrotas: ${_defeatCount.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 16),
              child: Text(
                'Empates: ${_drawCount.toString()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const BannerAdWidget(),
          ],
        ),
      ),
    );
  }
}
