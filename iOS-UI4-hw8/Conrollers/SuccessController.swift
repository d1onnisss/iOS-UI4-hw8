//
//  SuccessController.swift
//  iOS-UI4-hw8
//
//  Created by Alexey Lim on 5/6/24.
//

import UIKit
import SnapKit

class SuccessController: UIViewController {
    
    private let successLabel: UILabel = {
        let label = UILabel()
        label.text = "Success!"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
            
        view.addSubview(successLabel)
        
        successLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
