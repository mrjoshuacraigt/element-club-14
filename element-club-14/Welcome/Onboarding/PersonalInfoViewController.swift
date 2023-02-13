//
//  PersonalInfoViewController.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/9/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class PersonalInfoViewController: UIViewController {
    
    private let ref = Database.database().reference()
    
    private var units = ElementUnits.imperial
    
    private let stackInternalStacking: CGFloat = 8
    
    private let containerStack = UIStackView();
    
    private let profileImageView = UIImageView();
    
    private let firstNameTextField = UITextField.elementTextField(placerholder: "First Name")

    private let lastNameTextField = UITextField.elementTextField(placerholder: "First Name")
    
    private let emailTextField = UITextField.elementTextField(placerholder: "Last Name")
    
//    private let birthdayStackView = UIStackView.elementStackView(spacing: 2, axis: .vertical)
//    private let birthdayLabel = UILabel.elementLabel(title: "Birthday (dd mm year)", labelType: .title)
//    private let dateStackView =  UIStackView.elementStackView(spacing: 2, axis: .horizontal)
//    private let dayTextField = UITextField.elementTextField(placerholder: "dd")
//    private let monthTextField = UITextField.elementTextField(placerholder: "mm")
//    private let yearTextField = UITextField.elementTextField(placerholder: "year")

    private let unitSegmentedController = UISegmentedControl(items: [ElementUnits.imperial, ElementUnits.metric])
    
    private let datePicker = UIDatePicker()
    
    private let saveButton = UIButton.elementButton(title: "Save", color: .systemBlue, buttonType: .filled);

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        // Do any additional setup after loading the view.
    }
    
    @objc
    func unitsSegmentedControllerClicked(sender: UISegmentedControl) {
        
        units = sender.selectedSegmentIndex == 0 ? ElementUnits.imperial :  ElementUnits.metric
    }
    
    func setup() {
        
        //Profile Imageview
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(systemName: "person.crop.circle")
        profileImageView.contentMode = .scaleAspectFill
        
        
        unitSegmentedController.selectedSegmentIndex = 0
        unitSegmentedController.addTarget(self, action: #selector(unitsSegmentedControllerClicked(sender:)), for: .touchUpInside)
        
        unitSegmentedController.translatesAutoresizingMaskIntoConstraints = false
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        
        containerStack.addArrangedSubview(profileImageView)
        containerStack.addArrangedSubview(firstNameTextField)
        containerStack.addArrangedSubview(lastNameTextField)
        containerStack.addArrangedSubview(emailTextField)
        containerStack.addArrangedSubview(unitSegmentedController)
        containerStack.addArrangedSubview(datePicker)
        containerStack.addArrangedSubview(saveButton)
        
        
        
        
    }

}
