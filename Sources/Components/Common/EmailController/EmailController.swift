//
//  EmailController.swift
//  calorie-ios
//
//  Created by Margarita on 19.12.24.
//

import Foundation
import MessageUI

@MainActor
final class EmailController: NSObject, MFMailComposeViewControllerDelegate {
    public static let shared = EmailController()
    private override init() { }
    
    func sendEmail(body: String = "") {
        if !MFMailComposeViewController.canSendMail() {
            showAlert()
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["info@codabrasoft.com"])
        mailComposer.setSubject(UIApplication.getAppName())
        mailComposer.setMessageBody("\(body) \n\n\n \("Please do not delete this text") \n App version: \(UIApplication.version)\nDevice (OS version): \(UIDevice().type) (\(UIDevice.current.systemVersion))", isHTML: false)
        EmailController.getRootViewController()?.present(mailComposer, animated: true, completion: nil)
    }
    
    nonisolated func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        DispatchQueue.main.async {
            EmailController.getRootViewController()?.dismiss(animated: true, completion: nil)
        }
    }
    
    static func getRootViewController() -> UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene {
            return windowScene.windows.first?.rootViewController
        } else {
            return nil
        }
    }
    
    private func showAlert() {
        guard let rootVC = EmailController.getRootViewController() else {
            return
        }

        let alertController = UIAlertController(title: "No Email Account", message: "Your device is not connected to any email account", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        rootVC.present(alertController, animated: true, completion: nil)
    }
}

extension UIApplication {
    static var release: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String? ?? "x.x"
    }
    static var build: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String? ?? "x"
    }
    
    static var version: String {
        return "\(release)(\(build))"
    }
    
    static func getAppName() -> String {
        let dictionary: [String: Any] = Bundle.main.infoDictionary!
        let name: String = dictionary["CFBundleName"] as! String
        return name
    }
}
