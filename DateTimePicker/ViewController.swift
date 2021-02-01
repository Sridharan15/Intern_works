//
//  ViewController.swift
//  DateTimePicker
//
//  Created by Guest1 on 12/01/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var dateTextField: UITextField! {
        didSet {
            self.dateTextField.tag = 0
        }
    }
    
    @IBOutlet weak var timeTextField: UITextField! {
        didSet {
            self.timeTextField.tag = 1
        }
    }
    
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateTextField.delegate = self
        timeTextField.delegate = self
        //createDateTimePicker()
    }

    func createDateTimePicker(sender: UITextField) {
        self.view.frame.origin.y -= datePicker.frame.size.height
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed(button:)))
        doneBtn.tag = sender.tag
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        toolbar.setItems([doneBtn,flexibleSpace,cancelBtn], animated: true)
        
        sender.inputAccessoryView = toolbar
        sender.inputView = datePicker
        
        datePicker.preferredDatePickerStyle = .wheels    }
    
    @objc func donePressed(button: UIBarButtonItem) {
        self.view.frame.origin.y = 0
        switch button.tag {
        case 0:
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            dateTextField.text = formatter.string(from: datePicker.date)
        case 1:
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            timeTextField.text = formatter.string(from: datePicker.date)
        default:
            break
    }
        self.view.endEditing(true)
    }
    
    @objc func cancelPressed() {
        self.view.frame.origin.y = 0
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
          case dateTextField:
            datePicker.datePickerMode = .date
          case timeTextField:
            datePicker.datePickerMode = .time
          default:
            break
        }
        createDateTimePicker(sender: textField)
    }
}

