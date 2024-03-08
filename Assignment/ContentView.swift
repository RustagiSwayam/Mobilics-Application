import SwiftUI
import CoreData
import UIKit

struct ContentView: View {
    let info = informationList
    let device = UIDevice.current

    var body: some View {
        NavigationView{
            List{
                ForEach(info, id: \.self){information in
                    NavigationLink(destination: InfoDetailView(information: information)){
                        VStack{
                            HStack{
                                Image(systemName: self.getImageName(for: information))
                                Text(information)
                                    .font(.title)
                                Spacer()
                            }
                            Text("Tap to check your \(device.name)'s \(information)")
                        }
                    }
                }
                .navigationTitle("\(device.name)'s Information")
            }
        }
    }

    func getImageName(for information: String) -> String {
        switch information {
        case "Model Name":
            return "iphone"
        case "Model Number":
            return "number"
        case "iOS Version":
            return "applelogo"
        case "Device Serial Number":
            return "barcode"
        case "Storage":
            return "sdcard"
        case "Battery Level", "Battery Health":
            return "battery.25"
        case "Camera MegaPixel":
            return "camera"
        case "Camera Aperture":
            return "camera.aperture"
        case "Processor Information":
            return "cpu"
        case "GPU Information":
            return "memorychip"
        case "IMEI":
            return "number.square"
        default:
            return "questionmark"
        }
    }
}
