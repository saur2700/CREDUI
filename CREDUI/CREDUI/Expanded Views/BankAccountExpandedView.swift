//
//  BankAccountExpandedView.swift
//  CREDUI
//
//  Created by Saurav Kumar on 24/02/24.
//

import UIKit

final class BankAccountExpandedView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How to pay "
        label.textColor = .white
       return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "choose plans"
        label.textColor = .white
       return label
    }()
    
    private let containerView: UIStackView = {
        let view = UIStackView()
        view.spacing = 15
        view.axis = .vertical
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        self.backgroundColor = CredColors.bankBackground.uiColor
        self.layer.cornerRadius = 24
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BankAccountExpandedView {
    
    func commonInit() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(containerView)
        let customView1 = customChildView
        let customView2 = customChildView
        let customView3 = customChildView
        
        
        containerView.addArrangedSubview(customView1)
        containerView.addArrangedSubview(customView2)
        containerView.addArrangedSubview(customView3)
        
        customView1.widthAnchor.constraint(equalTo: self.stackView.widthAnchor).isActive = true
        customView2.widthAnchor.constraint(equalTo: self.stackView.widthAnchor).isActive = true
        customView3.widthAnchor.constraint(equalTo: self.stackView.widthAnchor).isActive = true
    }
    
    var customChildView: UIView {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        customView.backgroundColor = .systemPink.withAlphaComponent(0.5)
        customView.layer.cornerRadius = 16
        return customView
    }
    
    func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -20).isActive = true
    }
}

