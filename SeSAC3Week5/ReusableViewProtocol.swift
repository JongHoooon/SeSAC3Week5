//
//  ReusableViewProtocol.swift
//  SeSAC3Week5
//
//  Created by JongHoon on 2023/08/17.
//

import UIKit

protocol ReusableViewProtocol {}

extension ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableViewProtocol {}
extension UITableViewCell: ReusableViewProtocol {}
extension UICollectionReusableView: ReusableViewProtocol {}
