//
//  ViewController.swift
//  iOS-UI4-hw8
//
//  Created by Alexey Lim on 4/6/24.
//

import UIKit
import SnapKit

class StartScreen: UIViewController {
    
    private let verticalSV: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    private let firstBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 16
        button.setTitle("Transfer to KICB", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let secondBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 16
        button.setTitle("Transfer to Optima Bank", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let thirdBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 16
        button.setTitle("Transfer to MBANK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        
        firstBtn.addTarget(self, action: #selector(firstBtnTapped), for: .touchUpInside)
        secondBtn.addTarget(self, action: #selector(secondBtnTapped), for: .touchUpInside)
        thirdBtn.addTarget(self, action: #selector(thirdBtnTapped), for: .touchUpInside)
    }
    
    @objc private func firstBtnTapped(_ sender: UIButton) {
        let vc = KICBController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func secondBtnTapped(_ sender: UIButton) {
        let vc = OptimaController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func thirdBtnTapped(_ sender: UIButton) {
        let vc = MbankController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func setupUI() {
        verticalSVConfig()
        buttonsConfig()
    }
    
    private func verticalSVConfig() {
        view.addSubview(verticalSV)
        
        verticalSV.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(200)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
    }
    
    private func buttonsConfig() {
        verticalSV.addArrangedSubview(firstBtn)
        verticalSV.addArrangedSubview(secondBtn)
        verticalSV.addArrangedSubview(thirdBtn)
        
        firstBtn.snp.makeConstraints { make in
            make.height.equalTo(25)
        }
        
        secondBtn.snp.makeConstraints { make in
            make.height.equalTo(25)
        }
        
        thirdBtn.snp.makeConstraints { make in
            make.height.equalTo(25)
        }
    }
}

