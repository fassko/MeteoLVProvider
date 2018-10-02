//
//  ViewController.swift
//  MeteoLVProvider
//
//  Created by fassko on 02/16/2018.
//  Copyright (c) 2018 fassko. All rights reserved.
//

import UIKit
import MeteoLVProvider

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let provider = MeteoLVProvider()
    
    provider.latvianRoadsObservations { result in
      switch result {
        
      case let .success(stations):
        print(stations)
      case let .failure(error):
        print(error)
      }
    }
    
    provider.observations { result in
      switch result {
      case let .success(stations):
        print(stations)
      case let .failure(error):
        print(error)
      }
    }
  }
}
