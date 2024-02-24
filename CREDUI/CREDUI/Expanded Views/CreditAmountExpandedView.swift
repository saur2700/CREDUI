//
//  CreditAmountExpandedView.swift
//  CREDUI
//
//  Created by Saurav Kumar on 24/02/24.
//

import UIKit

final class CreditAmountExpandedView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello user, how much credit "
        label.textColor = .white
       return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "check below"
        label.textColor = .white
       return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let placeholder: UILabel = {
        let label = UILabel()
        label.text = "12,500"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        self.backgroundColor = CredColors.creditBackground.uiColor
        self.layer.cornerRadius = 24
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CreditAmountExpandedView {
    
    func commonInit() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(stackView)
        containerView.addSubview(placeholder)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(containerView)
        stackView.setCustomSpacing(20, after: valueLabel)
    }
    
    func setupConstraints() {
        placeholder.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        placeholder.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor).isActive = true
    }
}

