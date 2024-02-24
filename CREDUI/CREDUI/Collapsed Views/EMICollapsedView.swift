//
//  EMICollapsedView.swift
//  CREDUI
//
//  Created by Saurav Kumar on 24/02/24.
//

import UIKit

// Since EMI View is the last view Custom Collapsed View Won't work here.

final class EMICollapsedView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let emiTitleValueLabel = TitleView(frame: .zero)
    
    private let durationTitleValueLabel = TitleView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(emiViewModel: TitleView.TitleValueViewModel,
                   durationViewModel: TitleView.TitleValueViewModel) {
        self.emiTitleValueLabel.configure(viewModel: emiViewModel)
        self.durationTitleValueLabel.configure(viewModel: durationViewModel)
    }
}

private extension EMICollapsedView {
    
    func commonInit() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(emiTitleValueLabel)
        stackView.addArrangedSubview(durationTitleValueLabel)
    }
    
    func setupConstraints() {
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor).isActive = true
    }
}

