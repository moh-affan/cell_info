import 'package:flutter_test/flutter_test.dart';
import 'package:cell_info/cell_info.dart';
import 'package:cell_info/cell_info_platform_interface.dart';
import 'package:cell_info/cell_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCellInfoPlatform
    with MockPlatformInterfaceMixin
    implements CellInfoPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Map<String, dynamic>?> getCellularInfo() => Future.value({});
}

void main() {
  final CellInfoPlatform initialPlatform = CellInfoPlatform.instance;

  test('$MethodChannelCellInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCellInfo>());
  });

  test('getPlatformVersion', () async {
    CellInfo cellInfoPlugin = CellInfo();
    MockCellInfoPlatform fakePlatform = MockCellInfoPlatform();
    CellInfoPlatform.instance = fakePlatform;

    expect(await cellInfoPlugin.getPlatformVersion(), '42');
  });
}
