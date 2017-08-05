//
//  ViewController.swift
//  practice_3
//
//  Created by Anton Lebedev on 16.07.17.
//  Copyright © 2017 Anton Lebedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var carYearStepper: UIStepper!
    
    var delegate: AddNewCarDelegate?
    var carEdit: Car?
    
    var dateCar: Int = 2000 {
        didSet {
            setDateLabel()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setDateLabel()
        
        if let carEdit = carEdit {
        
            brandTextField.text = carEdit.brandCar
            modelTextField.text = carEdit.modelCar
            dateLabel.text = "\(carEdit.dateCar)"
            carYearStepper.value = Double(carEdit.dateCar)
            
        }
        
    }

    @IBAction func onTouchSaveDate(_ sender: UIButton) {
        print("onTouchSaveDate")
        
        var car: Car
        
        guard let brand = brandTextField.text, !brand.isEmpty  else {
            showAlert(with: "Fill brand")
            return
        }
        
        guard let model = modelTextField.text, !model.isEmpty else {
            showAlert(with: "Fill model")
            return
        }
        
        print("Brand: \(brand)")
        print("Model: \(model)")
        print("Date: \(dateCar)")


        
        if let carEdit = carEdit {
        
            car = carEdit
            car.brandCar = brand
            car.modelCar = model
            car.dateCar = dateCar
            delegate?.onEdited(car: car)
        } else {
            
            let car = Car(brandCar:  brand, modelCar: model, dateCar: dateCar)
            
            delegate?.onCreatedNew(car: car)
        }
        
        navigationController?.popViewController(animated: true)
        
    } 
    
    
    func showAlert(with title: String) {
        print(title)
        let alert = UIAlertController(title: "Error", message: title, preferredStyle: .alert)
        
        let actionOk = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            print("OK is tapped")
        }

        alert.addAction(actionOk)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onTouchStepper(_ sender: UIStepper) {
        dateCar = Int(sender.value)
        print("\(dateCar)")
    }
    
    func setDateLabel() {
        dateLabel.text = "\(dateCar)"
        
    }
    
    
    deinit {
        print("UIViewController is deinit ")
    }
    

    
    
}

