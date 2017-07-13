//
//  ViewController.swift
//  MaiKeFengDemo
//
//  Created by DSY on 2017/7/13.
//  Copyright © 2017年 DSY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSpeak: UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        btnSpeak.addTarget(self, action: #selector(showDialog), for: .touchDown)
        btnSpeak.addTarget(self, action: #selector(dissmissDialog), for: .touchUpInside)
    }

    func showDialog(){
        VoiceRecordDialog.show(vc: self)

    }

    func dissmissDialog(){

        VoiceRecordDialog.dissmiss()
    }
}

