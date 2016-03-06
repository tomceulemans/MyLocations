//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Tom Ceulemans on 06/03/16.
//  Copyright © 2016 Tom Ceulemans. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return nil
    }
}
