import Foundation

extension Date {
    func toShortTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "HH:mm:ss"
        
        return "\(dateFormatter.string(from: Date()))"
    }
}
