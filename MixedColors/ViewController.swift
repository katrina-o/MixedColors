//
//  ViewController.swift
//  MixedColors
//
//  Created by Катя on 15.09.2024.
//

import UIKit
import SnapKit

final class ViewController: UIViewController, UIColorPickerViewControllerDelegate {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Mix Colors"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
        
    let mainColorStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    let firstColorStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    let firstColorLabel: UILabel = {
        let label = UILabel()
        label.text = "BLUE"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let firstColorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(chooseColor), for: .touchUpInside)
        return button
    }()
    
    let plusLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let secondColorStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    let secondColorLabel: UILabel = {
        let label = UILabel()
        label.text = "RED"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let secondColorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(chooseColor), for: .touchUpInside)
        return button
    }()
    
    let equelLabel: UILabel = {
        let label = UILabel()
        label.text = "="
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
        
    let resultColorStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        
        return stack
    }()
    
    let resultColorLabel: UILabel = {
        let label = UILabel()
        label.text = "PURPLE"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let resultColor: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }

    
    @objc func chooseColor( _ sender: UIButton) {
        let colorArrays = [ UIColor.red,
                            UIColor.blue,
                            UIColor.green,
                            UIColor.purple,
                            UIColor.yellow,
                            UIColor.orange,
                            UIColor.brown
        ]
       
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        present(colorPickerVC, animated: true)
        
        func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            let color = viewController.selectedColor
            firstColorButton.backgroundColor = color
            secondColorButton.backgroundColor = color
        }
        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            let color = viewController.selectedColor
            firstColorButton.backgroundColor = color
            secondColorButton.backgroundColor = color
        }
        
    }
    
    func initialize() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(mainColorStack)
        
        mainColorStack.addArrangedSubview(firstColorStack)
        firstColorStack.addArrangedSubview(firstColorLabel)
        firstColorStack.addArrangedSubview(firstColorButton)
        
        mainColorStack.addArrangedSubview(plusLabel)
        
        mainColorStack.addArrangedSubview(secondColorStack)
        
        secondColorStack.addArrangedSubview(secondColorLabel)
        secondColorStack.addArrangedSubview(secondColorButton)
        
        mainColorStack.addArrangedSubview(equelLabel)
        
        mainColorStack.addArrangedSubview(resultColorStack)
        
        resultColorStack.addArrangedSubview(resultColorLabel)
        resultColorStack.addArrangedSubview(resultColor)

        

        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            
        }
   
        mainColorStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            
        }

        firstColorButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
        }

        secondColorButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
        }

        resultColor.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
        }

    }

}

