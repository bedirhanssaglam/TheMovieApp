import 'package:the_movie/src/core/constants/app/app_constants.dart';
import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager get instance {
    if (_instance != null) return _instance!;
    _instance = VexanaManager._init();
    return _instance!;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    isEnableTest: true,
    options: BaseOptions(
      baseUrl: AppConstants.instance.baseUrl,
      followRedirects: true,
    ),
  );
}
