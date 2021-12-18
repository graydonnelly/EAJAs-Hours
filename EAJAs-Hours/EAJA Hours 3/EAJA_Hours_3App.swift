//
//  EAJA_Hours_3App.swift
//  EAJA Hours 3
//
//  Created by Isi Donnelly on 7/28/21.
//

import SwiftUI

@main
struct EAJA_Hours_3App: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}







//This code is used to hide keyboard on a tap
extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
