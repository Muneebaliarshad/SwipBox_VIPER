//
//  AlertBuilder.swift
//  Swipbox_VIPER
//
//  Created by Muneeb Ali on 05/10/2024.
//

import UIKit

typealias ConfirmHandler = () -> Void
typealias CancelHandler = () -> Void

final class AlertBuilder: NSObject {

    public static func showSuccessAlert(message: String?) {
        showAlertWithType(title: "Success", message: message)
    }

    public static func showErrorAlert(message: String?) {
        showAlertWithType(title: "Error", message: message)
    }

    private static func showAlertWithType(title: String, message: String?, cancelButtonShow: Bool = false, confirmHandler: ConfirmHandler? = nil) {
        let alert = prepareAlert(title: title, message: message)
        addAction(alert: alert, title: "Okay", style: .default, handler: confirmHandler)

        if cancelButtonShow {
            addAction(alert: alert, title: "Cancel", style: .cancel)
        }
        presentAlert(alert: alert)
    }

    private static func prepareAlert(title: String?, message: String?) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }

    private static func presentAlert(alert: UIAlertController) {
        DispatchQueue.main.async {
            topMostController()?.present(alert, animated: true, completion: nil)
        }
    }

    /// Recursively finds the top most presented view controller
    static func topMostController(from controller: UIViewController? = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window?.rootViewController) -> UIViewController? {
        if let presented = controller?.presentedViewController {
            return topMostController(from: presented)
        }
        return controller
    }

    private static func addAction(alert: UIAlertController, title: String?, style: UIAlertAction.Style, handler: ConfirmHandler? = nil) {
        alert.addAction(UIAlertAction(title: title, style: style, handler: { _ in
            handler?()
        }))
    }
}
