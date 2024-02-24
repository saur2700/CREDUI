//
//  ViewController.swift
//  CREDUI
//
//  Created by Saurav Kumar on 24/02/24.
//

import UIKit

// A custom view, resembling a step-by-step form, supporting navigation and customization. Keeping reusability in focus i have
// made a swift package for that view which can be imported whenever needed
import StepFormView

final class ViewController: UIViewController {
    
    private enum Step: Int, CaseIterable {
        case creditAmount
        case emiSelection
        case bankAccount
        
        var buttonTitle: String {
            switch self {
            case .emiSelection:
                return "Select your Bank Account"
            case .creditAmount:
                return "Proceed to EMI Selection"
            case .bankAccount:
                return "Tap for 1-click KYC"
            }
        }
        
    }
    
    public let stepFormView: StepFormView = {
        let stepFormView = StepFormView()
        stepFormView.translatesAutoresizingMaskIntoConstraints = false
        return stepFormView
    }()
    
    private let bottomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(CredColors.buttonTitle.uiColor, for: .normal)
        button.backgroundColor = CredColors.buttonBackground.uiColor
        button.layer.cornerRadius = 24
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return button
    }()
    
    private let crossButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let button = UIButton(configuration: config)
        button.setImage(.init(systemName: "xmark"), for: .normal)
        button.tintColor = CredColors.buttonTitle.uiColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = CredColors.bankBackground.uiColor
        button.layer.cornerRadius = 20
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    private let helpButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let button = UIButton(configuration: config)
        button.setImage(.init(systemName: "questionmark"), for: .normal)
        button.tintColor = CredColors.buttonTitle.uiColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = CredColors.bankBackground.uiColor
        button.layer.cornerRadius = 20
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    private let topContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

private extension ViewController {
    func commonInit() {
        setupUI()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupUI() {
        self.view.backgroundColor = CredColors.background.uiColor
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        bottomButton.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        // Assigning step form view delegate and datasource same as table view
        stepFormView.delegate = self
        stepFormView.dataSource = self
    }
    
    func setupHierarchy() {
        self.view.addSubview(stepFormView)
        self.view.addSubview(bottomButton)
        self.topContainerView.addSubview(crossButton)
        self.topContainerView.addSubview(helpButton)
        self.view.addSubview(topContainerView)
        topContainerView.backgroundColor = CredColors.background.uiColor
        
    }
    
    func setupConstraints() {
        crossButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        crossButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 25).isActive = true
        helpButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        helpButton.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -25).isActive = true
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        stepFormView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stepFormView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        topContainerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        topContainerView.leadingAnchor
            .constraint(equalTo: self.view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor
            .constraint(equalTo: self.view.trailingAnchor).isActive = true
        topContainerView.heightAnchor
            .constraint(equalToConstant: 100).isActive = true
        stepFormView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        stepFormView.bottomAnchor.constraint(equalTo: self.bottomButton.topAnchor).isActive = true
        bottomButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    @objc func bottomButtonTapped() {
        if !stepFormView.next() {
            print("proceed to next flow")
        }
    }
    
}

extension ViewController: StepFormViewDelegate {
    
    func stepFormView(willMoveTo index: Int) {
        self.bottomButton.isEnabled = false
        let step = Step(rawValue: index)
        self.bottomButton.setTitle(step?.buttonTitle, for: .normal)
        switch step {
        case .none:
            break
        case .creditAmount:
            self.stepFormView.stackView.backgroundColor = CredColors.background.uiColor
            self.stepFormView.backgroundColor = CredColors.creditBackground.uiColor
        case .emiSelection:
            self.stepFormView.stackView.backgroundColor = CredColors.creditBackground.uiColor
            self.stepFormView.backgroundColor = CredColors.emiBackground.uiColor
        case .bankAccount:
            self.stepFormView.stackView.backgroundColor = CredColors.emiBackground.uiColor
            self.stepFormView.backgroundColor = CredColors.bankBackground.uiColor
        }
    }
    
    func stepFormView(didMoveTo index: Int) {
        self.bottomButton.isEnabled = true
    }
}


extension ViewController: StepFormViewDataSource {
    func numberOfSteps() -> Int {
        Step.allCases.count
    }
    
    private func collapsedContentView(_ step: ViewController.Step?)
    -> (collapsedView: UIView?,
        backgroundColor: UIColor?) {
        let collapsedContentView: UIView?
        let backgroundColor: UIColor?
        switch step {
        case .none:
            collapsedContentView = nil
            backgroundColor = nil
        case .emiSelection:
            let emiCollapsedView = EMICollapsedView(frame: .zero)
            let emiTitleText = NSAttributedString.withAttributes("EMI", color: .white.withAlphaComponent(0.5), fontSize: 14, weight: .medium)
            let emiValueText = NSAttributedString.withAttributes("Value", color: .white.withAlphaComponent(0.5), fontSize: 20, weight: .bold)
            
            let emiViewModel = TitleView.TitleValueViewModel.init(title: emiTitleText,
                                                                            value: emiValueText)
            let durationTitleText = NSAttributedString.withAttributes("Duration", color: .white.withAlphaComponent(0.5), fontSize: 14, weight: .medium)
            let durationValueText = NSAttributedString.withAttributes("Value", color: .white.withAlphaComponent(0.5), fontSize: 20, weight: .bold)
            
            let durationViewModel = TitleView.TitleValueViewModel.init(title: durationTitleText,
                                                                                 value: durationValueText)
            emiCollapsedView.configure(emiViewModel: emiViewModel, durationViewModel: durationViewModel)
            collapsedContentView = emiCollapsedView
            backgroundColor = CredColors.emiBackground.uiColor
        case .creditAmount:
            let titleValueLabel = TitleView.init(frame: .zero)
            let titleText = NSAttributedString.withAttributes("Credit", color: .white.withAlphaComponent(0.5), fontSize: 14, weight: .medium)
            let valueText = NSAttributedString.withAttributes("Value", color: .white.withAlphaComponent(0.5), fontSize: 20, weight: .bold)
            let viewModel = TitleView.TitleValueViewModel.init(title: titleText,
                                                                         value: valueText)
            titleValueLabel.configure(viewModel: viewModel)
            collapsedContentView = titleValueLabel
            backgroundColor = CredColors.creditBackground.uiColor
        case .bankAccount:
            collapsedContentView = nil
            backgroundColor = nil
        }
        return (collapsedContentView, backgroundColor)
    }
    
    func stepFormView(collapsedViewFor index: Int) -> UIView? {
        let step = Step.init(rawValue: index)
        let collapsedContentViewAndBackground = self.collapsedContentView(step)
        guard let collapsedContentView = collapsedContentViewAndBackground.collapsedView else {
            return nil
        }
        let collapsedView = CollapsedView(contentView: collapsedContentView)
        collapsedView.delegate = self
        collapsedView.backgroundColor = collapsedContentViewAndBackground.backgroundColor
        return collapsedView
    }
    
    func stepFormView(expandedViewFor index: Int) -> UIView? {
        let expandedView: UIView?
        let step = Step(rawValue: index)
        switch step {
        case .none:
            expandedView = nil
        case .emiSelection:
            expandedView = EMIExpandedView()
        case .creditAmount:
            expandedView = CreditAmountExpandedView()
        case .bankAccount:
            expandedView = BankAccountExpandedView()
        }
        return expandedView
    }
    
}

extension ViewController: CollapsedViewDelegate {
    func expandButtonTapped() {
        do {
            _ = try self.stepFormView.previous()
        } catch {
            print(error)
        }
    }
    
}


