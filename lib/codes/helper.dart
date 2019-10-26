
import 'package:saberlab_frontend_web/enums/BuildMode.dart';

class Helper{

  static BuildMode get buildMode {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.Release;
    }
    var result = BuildMode.Profile;
    assert(() {
      result = BuildMode.Debug;
      return true;
    }());
    return result;
  }

}