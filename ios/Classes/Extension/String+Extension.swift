//
//  String+Extension.swift
//  flutter_beauty
//
//  Created by Ren on 2022/2/16.
//

import Foundation

extension String {
    func convert2UIImage() -> UIImage? {
        guard let data = Data.init(base64Encoded: self) else {
            print("base转image失败？？？")
            return nil }
        return UIImage.init(data: data)
    }
}
