import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cell_info_method_channel.dart';

abstract class CellInfoPlatform extends PlatformInterface {
  /// Constructs a CellInfoPlatform.
  CellInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static CellInfoPlatform _instance = MethodChannelCellInfo();

  /// The default instance of [CellInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelCellInfo].
  static CellInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CellInfoPlatform] when
  /// they register themselves.
  static set instance(CellInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map<String, dynamic>?> getCellularInfo() {
    throw UnimplementedError('getCellularInfo() has not been implemented.');
  }
}
