import Flutter
import CoreTelephony

public class CellInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "cell_info", binaryMessenger: registrar.messenger())
    let instance = CellInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getCellularInfo":
      result(getCellularInfo())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getCellularInfo() -> [String: Any] {
      var info: [String: Any] = [:]

      if let carrier = CTTelephonyNetworkInfo().subscriberCellularProvider {
          info["mcc"] = carrier.mobileCountryCode
          info["mnc"] = carrier.mobileNetworkCode
      }

      if let networkInfo = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders?.values.first {
          info["lac"] = networkInfo.locationAreaCode
          info["cid"] = networkInfo.cellIdentifier
          info["radioType"] = getRadioType(networkInfo)
      }

      return info
  }

  private func getRadioType(_ networkInfo: CTCarrier) -> String {
      switch networkInfo.radioAccessTechnology {
      case CTRadioAccessTechnologyLTE:
          return "lte"
      case CTRadioAccessTechnologyWCDMA:
          return "wcdma"
      case CTRadioAccessTechnologyEdge:
          return "edge"
      case CTRadioAccessTechnologyGPRS:
          return "gsm"
      default:
          return "unknown"
      }
  }
}
