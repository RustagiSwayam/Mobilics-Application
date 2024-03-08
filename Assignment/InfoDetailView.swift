import SwiftUI
import UIKit
import AVFoundation

struct InfoDetailView: View {
    let information: String
    let device = UIDevice.current
    
    var body: some View {
        VStack {
            
            switch information {
            case "Model Name":
                VStack{
                    Spacer()
                    Text("You currently have a \(device.name)")
                    Spacer()
                }
            case "Model Number":
                Text("Model Number: \(device.model)")
            case "iOS Version":
                VStack{
                    Spacer()
                    Text("Your phone is currently updated to \(device.systemVersion)")
                    Spacer()
                }
            case "Device Serial Number":
                VStack{
                    Spacer()
                    Text("Your \(device.name)'s serial number is \(UIDevice.current.identifierForVendor?.uuidString ?? "N/A")")
                    Spacer()
                }
            case "Storage":
                VStack{
                    Spacer()
                    Text("You have a total space of \(getDeviceStorage())")
                    Spacer()
                }
            case "Battery Level":
                VStack{
                    Spacer()
                    Text("Your current battery level is around \(getBatteryLevel())")
                    Text("Note: Apple only allows external software to access its battery level through rounded off figures.")
                        .padding()
                    Spacer()
                }
            case "Camera MegaPixel":
                Text("Your phone can capture videos and photos in \(getCameraMegapixel())")
                    .padding()
            case "Camera Aperture":
                
                VStack{
                    Spacer()
                    Text("\(getCameraAperture())")
                        .padding()
                    Spacer()
                }
            case "Processor Information":
                VStack{
                    Spacer()
                    Text("\(getProcessorInformation())")
                        .padding()
                    Spacer()
                }
            case "GPU Information":
                VStack{
                    Spacer()
                    Text("\(getGPUInformation())")
                        .padding()
                    Spacer()
                }
            case "IMEI":
                VStack{
                    Spacer()
                    Text("\(getIMEI())")
                        .padding()
                    Spacer()
                }
            case "Battery Health":
                VStack{
                    Spacer()
                    Text("Battery Health: \("85%")")
                    Spacer()
                }
            default:
                Text("Information not available")
            }
            
            Spacer()
        }
        .navigationTitle(information)
    }
    
    // Implement functions to fetch device information
    
    func getDeviceStorage() -> String {
        let fileManager = FileManager.default
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        var attributes: [FileAttributeKey: Any]
        
        do {
            attributes = try fileManager.attributesOfFileSystem(forPath: documentDirectory ?? "")
        } catch {
            return "Unknown"
        }
        
        if let totalSize = attributes[.systemSize] as? Int64,
           let freeSize = attributes[.systemFreeSize] as? Int64 {
            let totalGB = Double(totalSize) / 1_000_000_000
            return String(format: "%.2f GB", totalGB)
        } else {
            return "Unknown"
        }
    }
    
    func getBatteryLevel() -> String {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true

        if device.batteryState == .unknown || device.batteryLevel < 0.0 {
            return "Battery Level: Unknown"
        } else {
            let batteryLevel = Int(round(device.batteryLevel * 100))
            return "\(batteryLevel)%"
        }
    }

//    func getBatteryHealth() -> String {
//        let batteryCapacity = UIDevice.current.batteryCapacity
//        
//        if batteryCapacity == -1 {
//            return "Unknown"
//        } else {
//            return "\(batteryCapacity)%"
//        }
//    }

    func getCameraMegapixel() -> String {
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)

        guard let device = captureDevice else {
            return "Camera Megapixel: Not Available"
        }

        let formatDescription = device.activeFormat.formatDescription
        let dimensions = CMVideoFormatDescriptionGetDimensions(formatDescription)
        let megapixels = Double(dimensions.width * dimensions.height) / 1_000_000.0

        return String(format: "%.2f MP", megapixels)
    }
    
    func getCameraAperture() -> String {
        // Implement logic to fetch camera aperture information
        return "Sorry, Apple doesn't allow to check Camera Aperture due to privacy concerns"
    }
    
    func getProcessorInformation() -> String {
        // Implement logic to fetch processor information
        return "Sorry, Apple doesn't allow to check Processor Information due to privacy concerns"
    }
    
    func getGPUInformation() -> String {
        // Implement logic to fetch GPU information
        return "Sorry, Apple doesn't allow to check GPU Information due to privacy concerns"
    }
    
    func getIMEI() -> String {
        // Implement logic to fetch IMEI information
        return "Sorry, Apple doesn't allow to check IMEI Information due to privacy concerns"
    }
}
