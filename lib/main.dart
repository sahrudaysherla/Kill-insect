import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swarm_game/game_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Util flameUtil = Util();
  WidgetsFlutterBinding.ensureInitialized();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  SharedPreferences storage = await SharedPreferences.getInstance();
  Flame.images.loadAll(<String>['images/fly1.png']);

  GameController gameController = GameController(storage);
  runApp(gameController.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = gameController.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}
