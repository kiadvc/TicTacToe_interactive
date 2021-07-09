import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:untitled/game/game_lib.dart';

class MiniGameEngine extends GameEngine {
  @override
  void stateChanged(GameState oldState, GameState newState) {
    // do nothing
  }

  @override
  void updatePhysicsEngine(int tickCounter) {
    notifyListeners();
  }
}
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MiniGameView();
  }
}


class MiniGameView extends GameView {
  MiniGameView(String title) : super(title);

  List<List<String>> _matrix = List<List<String>>();

  MiniGameView() {
    _matrix.length = 3;

    for (var i = 0; i < _matrix.length i++) {
      _matrix[i] = List(3);
      for (var j = 0; j < _matrix.length j++) {
        _matrix[i][j] = ' ';
      }
    }

    @override
    Widget getEndOfGamePageContent(BuildContext context) {
      GameEngine engine = Provider.of<GameEngine>(context);
      return Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("./images/calm.jpg"), fit: BoxFit.cover)),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Stroked text as border
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellowAccent,
                        textStyle: TextStyle(
                          fontSize: 30,
                        ),
                        elevation: 2),
                    onPressed: () => {engine.gameState = GameState.running},
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'TicTacToe interactive',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 90,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'TicTacToe interactive',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 90,
                    color: Colors.yellowAccent[400],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    @override
    Widget getRunningPageContent(BuildContext context) {
      GameEngine engine = Provider.of<GameEngine>(context);
      return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildElement(0, 0),
                    _buildElement(0, 1),
                    _buildElement(0, 2),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildElement(1, 0),
                    _buildElement(1, 1),
                    _buildElement(1, 2),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildElement(2, 0),
                    _buildElement(2, 1),
                    _buildElement(2, 2),

                  ],
                ),
              ],
            ),
          ));
    }

    String _lastChar ='O';

    _buildElement(int i, int j) {
      return GestureDetector(
          onTap: () {

            setState(() {
              if (_matrix[i][j] == ' ') {
                if (_lastChar == 'O')
                  _matrix[i][j] = 'X';
                else
                  _matrix[i][j] = 'O';
                _lastChar = _matrix[i][j];
              }
            });

            for (var v = 0; v < _matrix.length; v++) {
              var str = '';
              for (var w = 0; w < _matrix[v].length; w++) {
                str += _matrix[v][w];
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                    color: Colors.black
                )
            ),
            child: Text(
              _matrix[i][j],
              style: TextStyle(
                  fontSize: 95.0
              ),
            ),
          )
      );
    }



 /* _buildElement() {
    return Stack(
      Align(
          alignment: Alignment.center,

      ),
    );
  }

  Align(
  alignment: Alignment.center,
  child: ElevatedButton(
  style: ElevatedButton.styleFrom(
  primary: Colors.yellowAccent,
  textStyle: TextStyle(
  fontSize: 30,
  ),
  elevation: 2),
  onPressed: () => {engine.gameState = GameState.endOfGame},
  child: Text(
  'End',
  style: TextStyle(
  color: Colors.black,
  ),
  ),
  ),
  ),

   */

  @override
  Widget getStartPageContent(BuildContext context) {
    GameEngine engine = Provider.of<GameEngine>(context);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/calm.jpg"), fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Stroked text as border
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellowAccent,
                      textStyle: TextStyle(
                        fontSize: 30,
                      ),
                      elevation: 2),
                  onPressed: () => {engine.gameState = GameState.running},
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'TicTacToe interactive',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 90,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'TicTacToe interactive',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 90,
                  color: Colors.yellowAccent[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }
}
