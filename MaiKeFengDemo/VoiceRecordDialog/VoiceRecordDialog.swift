//
//  VoiceRecordDialog.swift
//  Maikefeng
//
//  Created by DSY on 2017/7/13.
//  Copyright © 2017年 DSY. All rights reserved.
//

import Foundation
import UIKit

class VoiceRecordDialog:UIView{

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet var view: UIView!
    @IBOutlet weak var maikefengTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var voiceImg: UIImageView!
    @IBOutlet weak var macImg: UIImageView!
    static var height : CGFloat{
        switch UIScreen.main.bounds.width {
        case 320:
            return 115
        default:
            return 130
        }
    }

    static let voiceRecordDialog = VoiceRecordDialog.init(frame: CGRect.init(x: UIScreen.main.bounds.width / 2 - height / 2, y: UIScreen.main.bounds.height / 2 - height / 2, width: height, height: height))

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "VoiceRecordDialog", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = bounds
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        UINib(nibName: "VoiceRecordDialog", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = bounds
        view.layer.cornerRadius = 10

        switch UIScreen.main.bounds.width {
        case 320:
            maikefengTopConstraint.constant = maikefengTopConstraint.constant - 5
            leftConstraint.constant = leftConstraint.constant - 3
            rightConstraint.constant = rightConstraint.constant - 3
        default:
            break
        }

        let name: String? = "ic_record"
        let filePath: String? = Bundle.main.path(forResource: name, ofType: "png")
        let image: UIImage? = UIImage(contentsOfFile: filePath!)
        macImg.image = image

        //定义帧动画
        var imgArray:[UIImage]! = []
        for i in 1 ... 8
        {
            // 拼接名称
            let name: String? = "ic_record_ripple" + "-\(i)"
            let filePath: String? = Bundle.main.path(forResource: name, ofType: "png")
            // 根据路径获得图片
            let image: UIImage? = UIImage(contentsOfFile: filePath!)
            // 往数组中添加图片
            imgArray.append(image!)
        }
        // 给动画数组赋值
        voiceImg.animationImages = imgArray
        voiceImg.animationRepeatCount = 0
        voiceImg.animationDuration = 1.5
    }

    //调用显示
   static func show(vc:UIViewController){
        vc.view.addSubview(voiceRecordDialog)
        voiceRecordDialog.voiceImg.startAnimating()
    }

     //调用消失
  static  func dissmiss(){
        voiceRecordDialog.removeFromSuperview()
        voiceRecordDialog.voiceImg.stopAnimating()
    }

}


