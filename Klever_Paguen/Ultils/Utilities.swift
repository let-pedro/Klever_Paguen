
import Foundation
import SwiftUI


struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
}


struct Colors {
    
    let GradientHeader = [
                          Color(red: 0.99, green: 0.32, blue: 0.52, opacity: 1),
                          Color(red: 0.42, green: 0.31, blue: 0.45, opacity: 1),
                          Color(red: 0.21, green: 0.31, blue: 0.42, opacity: 1),
                          ]
    
    let ColorBorderFiedls = Color(red: 0.21, green: 0.31, blue: 0.42, opacity: 1)
    let ColorButton = Color(red: 0.99, green: 0.32, blue: 0.52, opacity: 1)
}


struct FormatadorDeData {
        
    func FormatDataInString(_ data: Date) -> String {
        let formatador = DateFormatter()
        formatador.timeZone = TimeZone(abbreviation: "GMT-3")
        formatador.dateFormat = "dd/MM/yyyy"
        
        return formatador.string(from: data)
    }
    
    func FormatStringInData(_ data: String) -> Date? {
        let formatador = DateFormatter()
        formatador.timeZone = TimeZone(abbreviation: "GMT-3")
        formatador.dateFormat = "dd/MM/yyyy HH:mm"
        
        return formatador.date(from: data)
    }
}


