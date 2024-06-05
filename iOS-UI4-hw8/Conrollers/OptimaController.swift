//
//  OptimaController.swift
//  iOS-UI4-hw8
//
//  Created by Alexey Lim on 5/6/24.
//

import UIKit

class OptimaController: UIViewController, ValidateProtocol {

    private let verticalSV: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.distribution = .equalSpacing
        return view
    }()
    
    private let cardTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter a card number"
        tf.textColor = .black
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 12
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        
        return tf
    }()
    
    private let amountTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter an amount of transfer"
        tf.textColor = .black
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.cornerRadius = 12
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        tf.leftView = leftView
        tf.leftViewMode = .always
        
        return tf
    }()
    
    private let cardNumber: UILabel = {
        let label = UILabel()
        label.text = "Card number: 4169 5853 4769 0488"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let cardAmount: UILabel = {
        let label = UILabel()
        label.text = "Balance: 5000 KGS"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let sendBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 16
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        
        setupUI()
        cardTF.addTarget(self, action: #selector(validateTF(_:)), for: .editingChanged)
        amountTF.addTarget(self, action: #selector(validateTF(_:)), for: .editingChanged)
        sendBtn.addTarget(self, action: #selector(sendBtnTapped), for: .touchUpInside)
    }
    
    private func setupUI() {
        verticalSVConfig()
        tfConfig()
        cardInfoConfig()
        sendBtnConfig()
    }
    
    @objc func validateTF(_ sender: Any) {
        cardTFValidate(cardNumber: cardTF, amountTF: amountTF, validateBtn: sendBtn)
    }
    
    @objc func sendBtnTapped(_ sender: UIButton) {
        let vc = SuccessController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func verticalSVConfig() {
        view.addSubview(verticalSV)
        
        verticalSV.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.centerY.equalTo(view.snp.centerY)
            make.height.equalTo(100)
        }
    }
    
    private func tfConfig() {
        verticalSV.addArrangedSubview(cardTF)
        verticalSV.addArrangedSubview(amountTF)
        
        cardTF.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        amountTF.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    private func cardInfoConfig() {
        view.addSubview(cardAmount)
        view.addSubview(cardNumber)
        
        cardAmount.snp.makeConstraints { make in
            make.bottom.equalTo(verticalSV.snp.top).offset(-10)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
        
        cardNumber.snp.makeConstraints { make in
            make.bottom.equalTo(cardAmount.snp.top).offset(-10)
            make.horizontalEdges.equalToSuperview().inset(40)
        }
    }
    
    private func sendBtnConfig() {
        view.addSubview(sendBtn)
        
        sendBtn.snp.makeConstraints { make in
            make.top.equalTo(verticalSV.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(40)
        }
    }
}
