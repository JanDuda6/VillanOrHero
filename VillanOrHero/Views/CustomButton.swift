//
//  ButtonAppearance.swift
//  MarvelVillanOrHero
//
//  Created by Kurs on 22/09/2020.
//  Copyright © 2020 Kurs. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtonShadow()
    }

    func setUpButtonShadow() {
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
