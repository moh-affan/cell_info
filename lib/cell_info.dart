import 'cell_info_platform_interface.dart';

class CellInfo {
  Future<String?> getPlatformVersion() {
    return CellInfoPlatform.instance.getPlatformVersion();
  }

  Future<Map<String, dynamic>?> getCellularInfo() {
    return CellInfoPlatform.instance.getCellularInfo();
  }
}
