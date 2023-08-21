//
//  SeSACButton.swift
//  SeSAC3Week5
//
//  Created by JongHoon on 2023/08/21.
//

import UIKit

@IBDesignable
final class SeSACButton: UIButton {
    
    // 런타임에 확인 가능했던 것들 컴파일 타임에도 확인할 수 있따.
    
    @IBInspectable
    var customCornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
}
