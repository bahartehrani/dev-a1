//
//  ViewController.swift
//  dev-a1app
//
//  Created by Productivity on 3/1/20.
//  Copyright © 2020 Productivity. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var toDoLabel : UILabel!
    var addItemButton: UIButton!
    var itemToAdd : UITextField!
    var updatedList : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 251/255, green: 223/255, blue: 182/255, alpha: 1.0)
        
        toDoLabel = UILabel()
        toDoLabel.text = "#todo"
        toDoLabel.textColor = .black
        toDoLabel.textAlignment = .center
        toDoLabel.font = UIFont(name: "Avenir-HeavyOblique", size: 70)
        toDoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toDoLabel)
        
        addItemButton = UIButton()
        addItemButton.addTarget(self, action: #selector(addItemPressed), for: .touchUpInside)
        addItemButton.setTitle("add item" , for: .normal)
        addItemButton.setTitleColor(.black, for: .normal)
        addItemButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 15)
        addItemButton.layer.borderColor = UIColor.black.cgColor
        addItemButton.layer.cornerRadius = 8.0
        addItemButton.layer.borderWidth = 1
        view.addSubview(addItemButton)
        
        itemToAdd = UITextField()
        itemToAdd.text = "enter here"
        itemToAdd.font = UIFont(name: "Avenir-Light", size: 15)
        itemToAdd.textAlignment = .center
        itemToAdd.textColor = .black
        itemToAdd.layer.borderColor = UIColor.black.cgColor
        itemToAdd.layer.cornerRadius = 8.0
        itemToAdd.layer.borderWidth = 1
        view.addSubview(itemToAdd)
        
        updatedList = UITextView()
        //updatedList.text = "test"
        updatedList.font = UIFont(name: "AmericanTypewriter", size: 15)
        updatedList.backgroundColor = view.backgroundColor
        updatedList.textAlignment = .left
        updatedList.textColor = .black
        updatedList.isEditable = false
        view.addSubview(updatedList)
        
        setupConstraints()
    }
    
    @objc func addItemPressed() {
        
        if let txt = itemToAdd.text {
            if (txt != "") {
                updatedList.insertText("● \t\t" + txt + "\n\n")
            }
        }
        itemToAdd.text = ""
    }
    
    // What I focused on learning - SnapKit!
    func setupConstraints() {
        
        toDoLabel.snp.makeConstraints { make in
            
            /** SnapKit makes "relative" constraints easy, but adjusting based
                on the Superview - so the device you're using doesn't matter.
            */
            make.width.equalToSuperview().multipliedBy(0.60)
            make.height.equalToSuperview().multipliedBy(0.2)
            
            /** Setting up constraints in this way also greatly increases readability of the code.
                Offsets can also be done by number of pixels in this way.
             */
            make.top.equalToSuperview().offset(45)
            make.centerX.equalToSuperview().offset(-80)
        }
        
        /** When setting a constraint relative to another element, it assumes the top of the element.
            So when setting a constraint to an element at the top, you have to specify your constraint is
            relative to the bottom of that element.
         
         */
        updatedList.snp.makeConstraints { make in
            make.top.equalTo(toDoLabel.snp_bottom)
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
        
        itemToAdd.snp.makeConstraints { make in
            make.top.equalTo(updatedList.snp_bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.25)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.centerX.equalToSuperview().offset(-80)
        }
        
        addItemButton.snp.makeConstraints { make in
            make.top.equalTo(updatedList.snp_bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.25)
            make.height.equalToSuperview().multipliedBy(0.05)
            make.leading.equalTo(itemToAdd.snp_trailing).offset(40)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
