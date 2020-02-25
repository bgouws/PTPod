import Foundation
import UIKit

public class PTBasic {
    public static func ptValidationCheck(email: String) -> Bool {
        print("PTFramework Validation Check.")
        //Email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
