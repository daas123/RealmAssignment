//
//  navigation+extention.swift
//  RealmAssignment
//
//  Created by Neosoft on 16/10/23.
//

import UIKit
extension UINavigationController{
    open override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = Usercolors.redcolor
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        ]
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationBar.tintColor = UIColor(named: "Primary Foreground")
    }

}
