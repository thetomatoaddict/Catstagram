//
//  ViewController+extention.swift
//  CatStaGram
//
//  Created by sujin on 2022/11/26.
//

import UIKit


extension UIViewController {
    func generateButtonAttribute(_ button: UIButton, texts: String..., fonts: UIFont..., colors: UIColor...) -> NSMutableAttributedString {
        
        //UIButton에 입력된 텍스트를 가져온다
        guard let wholeText = button.titleLabel?.text else { fatalError("버튼에 텍스트가 없음.") }
        
        //폰트들
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 String의 NSRanges
        let customTextRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        //설정하고자 하는 색상들
        let customColors = colors
        
        //어트리뷰트 객체를 생성한다.
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        //텍스트에 맞는 설정을 추가한다.
        texts.indices.forEach { index in
            attributedString.addAttribute(.font,
                                          value: customFonts[index],
                                          range: customTextRanges[index])
            attributedString.addAttribute(.foregroundColor,
                                          value: customColors[index],
                                          range: customTextRanges[index])
        }
        return attributedString
    }
}
