import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  bool valida = true;
  int _countDerrota = 0;
  int _countEmpate = 0;
  int _countVitoria = 0;
  double _height = 130;
  Color _color = Colors.white;

  var _imagemApp = AssetImage('images/padrao.png');
  var _opcoes = ['pedra', 'papel', 'tesoura'];
  var _mensagem = 'Ecolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUsuario) {
    var numero = Random().nextInt(_opcoes.length);
    var escolhaApp = _opcoes[numero];

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imagemApp = AssetImage('images/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          this._imagemApp = AssetImage('images/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          this._imagemApp = AssetImage('images/tesoura.png');
        });
        break;
    }

    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        this._mensagem = 'Parabêns, você venceu';
        _color= Colors.green;
        _countVitoria = _countVitoria + 1;
        _height = 100;
      });
    } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')) {
      setState(() {
        this._mensagem = 'Você perdeu';
        _color= Colors.red;
        _countDerrota = _countDerrota + 1;
        _height = 100;
      });
    } else {
      setState(() {
        this._mensagem = 'Empate';
        _color= Colors.white;
        _countEmpate = _countEmpate + 1;
        _height = 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
        backgroundColor: Colors.black,
      ),
     // backgroundColor: _color,
      body: Align(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: double.infinity,
            height: _height,
            color: _color,
            padding: EdgeInsets.only(top: 35, bottom: 10),
            child: Text(
               _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
          ), 
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Ecolha do app',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do usuário',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada(_opcoes[0]);
                },
                child: Image.asset('images/pedra.png', height: 95),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada(_opcoes[1]);
                },
                child: Image.asset('images/papel.png', height: 95),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada(_opcoes[2]);
                },
                child: Image.asset('images/tesoura.png', height: 95),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Vitórias : '+ _countVitoria.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 16),
            child: Text(
              'Derrotas : ' + _countDerrota.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 16),
            child: Text(
              'Empates : ' + _countEmpate.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
