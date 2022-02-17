//
//  UIImage+Extension.swift
//  flutter_beauty
//
//  Created by Ren on 2022/2/16.
//

import Foundation

extension UIImage {
    func convert2Base64() -> String?{
        guard let imageData = self.pngData() else {
            return nil
        }
        return imageData.base64EncodedString()
    }
}
