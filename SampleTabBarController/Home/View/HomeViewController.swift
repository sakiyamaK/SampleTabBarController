//
//  HomeView.swift
//  SampleTabBarController
//
//  Created by  on 2021/5/4.
//

import UIKit

enum SegueButton: String, CaseIterable {
    case animation, customTab, appearance
    
    var button: UIButton {
        let button = UIButton()
        button.setTitle(rawValue, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }
    
    func segue(presenter: HomePresentation) {
        presenter.tap(button: self)
    }
}

protocol HomeView: AnyObject {
}

final class HomeViewController: UIViewController {
    
    private var presenter: HomePresentation!
    func inject(presenter: HomePresentation) {
        self.presenter = presenter
    }
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.edgesEquartToSuperView()
        
        SegueButton.allCases.map { $0.button }.forEach { button in
            button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        presenter.viewDidLoad()
    }
}


extension HomeViewController: HomeView {
}

@objc private extension HomeViewController {
    func tapButton(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        SegueButton(rawValue: text)?.segue(presenter: presenter)
    }
}
