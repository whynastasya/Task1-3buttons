//
//  ViewController.swift
//  UIKitMarathon_task2_ 3buttons
//
//  Created by nastasya on 05.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private var currentOffset = CGFloat(100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton(withTitleText: "First button", animations: [.scale])
        setupButton(withTitleText: "SecondSecondSecond button", animations: [.scale])
        setupButton(withTitleText: "3", animations: [.scale, .showModalView])
    }
    
    private func setupButton(withTitleText text: String, animations: [Animations]) {
        let button = UIButton(configuration: .filled())
        button.frame = CGRect(x: 0, y: currentOffset, width: 300, height: 50)
        button.configuration?.image = UIImage(systemName: "paperclip.circle")
        button.configuration?.imagePlacement = .trailing
        button.configuration?.imagePadding = 8
        button.configuration?.title = text
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        button.sizeToFit()
        button.center.x = view.center.x
        
        switch animations {
            case [.scale]:
                button.addTarget(self, action: #selector(buttonClamped(sender:)), for: .touchDown)
                button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            case [.scale, .showModalView]:
                button.addTarget(self, action: #selector(buttonClamped(sender:)), for: .touchDown)
                button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
                button.addTarget(self, action: #selector(showModalViewController), for: .touchUpInside)
            default:
                return
        }
        view.addSubview(button)
        currentOffset += 50
//        button.center = view.center
//        button.setTitle(text, for: .normal)
//        button.setImage(UIImage(systemName: "paperclip.circle"), for: .normal)
//        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
//        button.semanticContentAttribute = .forceRightToLeft
//        button.sizeToFit()
//        button.tintColor = .white
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 10
//        button.tintAdjustmentMode = .dimmed
    }
    
    @objc func buttonClamped(sender: UIButton) {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            sender.transform = sender.transform.scaledBy(x: 0.7, y: 0.7)
        })
    }
    
    @objc func buttonPressed(sender: UIButton) {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            sender.transform = CGAffineTransform.identity
        })
    }

    @objc func showModalViewController(sender: UIButton) {
        present(ModallViewController(), animated: true)
    }
}

