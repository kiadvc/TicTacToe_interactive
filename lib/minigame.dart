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

class MiniGameView extends GameView {
  MiniGameView(String title) : super(title);

  @override
  Widget getEndOfGamePageContent(BuildContext context) {
    GameEngine engine = Provider.of<GameEngine>(context);
    return Scaffold (
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./images/roadrage.jpg"),
                fit: BoxFit.cover)),
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

                  onPressed: () => {engine.gameState = GameState.running}, child:
              Text(
                'Start',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Highway Speeder',
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
                'Highway Speeder',
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
    return Scaffold (
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/roadrage.jpg"),
                fit: BoxFit.cover)),
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

                  onPressed: () => {engine.gameState = GameState.endOfGame}, child:
              Text(
                'End',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget getStartPageContent(BuildContext context) {
    GameEngine engine = Provider.of<GameEngine>(context);
    return Scaffold (
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/roadrage.jpg"),
                fit: BoxFit.cover)),
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

                  onPressed: () => {engine.gameState = GameState.running}, child:
              Text(
                'Start',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Highway Speeder',
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
                'Highway Speeder',
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