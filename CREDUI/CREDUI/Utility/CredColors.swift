//
//  CredColors.swift
//  CREDUI
//
//  Created by Saurav Kumar on 24/02/24.
//

import UIKit

enum CredColors {
    
    case background
    case buttonTitle
    case buttonBackground
    case creditBackground
    case bankBackground
    case emiBackground
    
    var uiColor: UIColor {
        switch self {
        case .background:
            return .init(red: 0.06, green: 0.08, blue: 0.12, alpha: 1)
        case .creditBackground:
            return .init(red: 20/255, green: 25/255, blue: 35/255, alpha: 1)
        case .buttonTitle:
            return .white
        case .buttonBackground:
            return .init(red: 45/255, green: 55/255, blue: 120/255, alpha: 1)
        case .emiBackground:
            return .init(red: 27/255, green: 35/255, blue: 44/255, alpha: 1)
        case .bankBackground:
            return .init(red: 32/255, green: 40/255, blue: 49/255, alpha: 1)
        }
    }
}

