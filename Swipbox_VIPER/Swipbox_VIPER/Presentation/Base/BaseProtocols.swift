//
//  BaseProtocols.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import Foundation

protocol BaseViewProtocol: AnyObject {
    func showData(_ isShow: Bool)
}

protocol BasePresenterProtocol: AnyObject {
    func viewDidLoad()
}
