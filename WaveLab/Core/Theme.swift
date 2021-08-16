//
//  Theme.swift
//  TaskTest
//
//  Created by Hải Nguyễn on 13/08/2021.
//

import Foundation
import UIKit

class Theme {
    static let shared = Theme()
    
    /// Primary app
    var primary = #colorLiteral(red: 0.0862745098, green: 0.4862745098, blue: 0.8235294118, alpha: 1)
    
    /// Text placeholder
    var placeholder = #colorLiteral(red: 0.7801656127, green: 0.7802976966, blue: 0.7801482081, alpha: 1)
    
    /// Textfield underline
    var underlineTextField = #colorLiteral(red: 0.716986835, green: 0.7171089053, blue: 0.7169707417, alpha: 0.41)
    
    /// Content text
    var content = #colorLiteral(red: 0.3195930123, green: 0.319652319, blue: 0.3195852637, alpha: 1)
    
    /// Sub content text
    var subContent = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    /// Title text
    var title = #colorLiteral(red: 0.1327547431, green: 0.1327844262, blue: 0.132750839, alpha: 1)
    
    /// Header text
    var header = #colorLiteral(red: 0.02828379162, green: 0.0282945279, blue: 0.02828237787, alpha: 1)
    
    /// Title button style: Active
    var titleActiveButton = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    /// Title button style: Deactive
    var titleDeactiveButton = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    /// Title button style: None
    var titleNoneButton = #colorLiteral(red: 0.08629973978, green: 0.485722959, blue: 0.8248810172, alpha: 1)
    
    /// Background color button style: Active
    var activeButton = #colorLiteral(red: 0.08629973978, green: 0.485722959, blue: 0.8248810172, alpha: 1)
    
    /// Background color button style: Deactive
    var deactiveButton = #colorLiteral(red: 0.9248043895, green: 0.9249593616, blue: 0.9247839451, alpha: 1)
    
    /// Background color button style: None
    var noneButton = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
}
