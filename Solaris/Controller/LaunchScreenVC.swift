//
//  LaunchScreenVC.swift
//  Solaris
//
//  Created by Nazar Petruk on 03/12/2019.
//  Copyright © 2019 Nazar Petruk. All rights reserved.
//

import UIKit

class LaunchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline:.now() + 1, execute: {
           self.performSegue(withIdentifier:"toMain",sender: self)
        })
    }
}
