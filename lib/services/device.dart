import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  DeviceInfoService._();

  static DeviceInfoService? _deviceUtil;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static Map<String, dynamic> deviceData = <String, dynamic>{};

  static Future<DeviceInfoService> getInstance() async {
    if (_deviceUtil == null) {
      var secureStorage = DeviceInfoService._();
      await secureStorage._init();
      _deviceUtil = secureStorage;
    }
    return _deviceUtil ??= DeviceInfoService._();
  }

  Future<void> _init() async {
    await getDeviceInfo();
  }

  static Future<void> getDeviceInfo() async {
    if (Platform.isAndroid) {
      deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
  }

  static dynamic getDeviceBrand() {
    if (Platform.isIOS) {
      return 'Iphone';
    } else if (Platform.isAndroid) {
      return deviceData['brand'];
    }
  }

  static dynamic getDeviceName() {
    return deviceData['model'];
  }

  static dynamic getDeviceOsVersion() {
    if (Platform.isIOS) {
      return deviceData['version.release'];
    } else if (Platform.isAndroid) {
      return deviceData['systemVersion'];
    }
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'uuid': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'uuid': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
