import UIKit
func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

let str = "{\"slongitude\":77.441157,\"slatitude\":9.0853365,\"order_id\":\"6000000137\",\"dlongitude\":\"-122.406417\",\"dlatitude\":\"37.785834\"}"

let dict = convertToDictionary(text: str)
print(dict ?? [:])
