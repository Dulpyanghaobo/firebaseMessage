//
//  Extensions.swift
//  firebaseDemo1103
//
//  Created by yhb on 2020/11/3.
//

import UIKit

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    public var height: CGFloat {
        return frame.size.height
    }
    public var top: CGFloat {
        return frame.origin.y
    }
    public var bottom : CGFloat {
        return frame.size.height + frame.origin.y
    }
    public var left : CGFloat {
        return frame.origin.x
    }
    public var right : CGFloat {
        return frame.origin.x + frame.size.width
    }
    //获取statusBar的高度
    public var navHeight : CGFloat {
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}
extension UIApplication {
    static var statusBarHeight : CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = shared.windows.filter{$0.isKeyWindow} .first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = shared.statusBarFrame.height
        }
        return statusBarHeight
    }
}
