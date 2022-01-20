import UIKit

extension String {
    /// center-aligns the String
    func center() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle
        ]
                
        return NSAttributedString(string: self, attributes: attributes)
    }
}
