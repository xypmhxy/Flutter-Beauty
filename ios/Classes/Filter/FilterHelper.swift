//
//  FilterHelper.swift
//  flutter_beauty
//
//  Created by Ren on 2022/2/16.
//

import Foundation
import GPUImage
import CoreImage

class FilterHelper {
    static let shared = FilterHelper()
    
    var originImage: UIImage!
    
    func setupOriginImage(image: UIImage){
        originImage = image
        print("初始化完成")
    }
    
    func renderFilter(dict: NSDictionary?) -> String?{
        guard let dict = dict else {
            let ex = ExposureAdjustment()
            ex.exposure = 0.3
            let sa = SaturationAdjustment()
            sa.saturation = 1.13
            let hi = HighlightsAndShadows()
            hi.shadows = 0.18
            var newImage = originImage.filterWithOperation(ex)
            newImage = newImage.filterWithOperation(sa)
            newImage = newImage.filterWithOperation(hi)
            return newImage.convert2Base64()
        }
        let type: String? = dict.value(forKey: "type") as? String
        var newImage = originImage
        switch type {
            ////对比度
        case "contrast":
            let contrastFilter = ContrastAdjustment()
            let contrast = Float(dict.value(forKey: "contrast") as! Double)
            contrastFilter.contrast = contrast
            newImage = originImage.filterWithOperation(contrastFilter)
        default :
            newImage = originImage.filterWithOperation(ColorInversion())
            
        }
        return newImage?.convert2Base64()
    }
}
