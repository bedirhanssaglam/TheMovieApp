import '../../constants/app/app_constants.dart';
import '../../init/network/vexana_manager.dart';
import '../../init/routes/routes.dart';
import '../functions/base_functions.dart';

abstract class BaseSingleton {
  AppConstants get constants => AppConstants.instance;
  VexanaManager get vexana => VexanaManager.instance;
  BaseFunctions get functions => BaseFunctions.instance;
  Routes get routes => Routes.instance;
}
