//
//  TitleView.swift
//  CREDUI
//
//  Created by Saurav Kumar on 24/02/24.
//

import UIKit

final class TitleView: UIView {
    
    struct TitleValueViewModel {
        let title: NSAttributedString
        let value: NSAttributedString
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel = UILabel()
    
    private let valueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TitleView {
    
    func commonInit() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
    }
    
    func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
}


extension TitleView {
    
    func configure(viewModel: TitleValueViewModel) {
        self.titleLabel.attributedText = viewModel.title
        self.valueLabel.attributedText = viewModel.value
    }
    
}

