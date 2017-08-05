//
//  CarListVC.swift
//  practice_3
//
//  Created by Anton Lebedev on 16.07.17.
//  Copyright © 2017 Anton Lebedev. All rights reserved.
//

import UIKit

class CarListVC: UIViewController, UITableViewDataSource, AddNewCarDelegate, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var cars: [Car] = [Car(brandCar: "VW", modelCar: "Golf", dateCar: 2005), Car(brandCar: "VW", modelCar: "Passat", dateCar: 2007),Car(brandCar: "Mazda", modelCar: "3", dateCar: 2004)]
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        let car = cars[indexPath.row]
        
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0, green: 0, blue: 100, alpha: 0.8)
        } else {
            cell.backgroundColor = UIColor(red: 100, green: 0, blue: 100, alpha: 0.8)
        
        }
        
        cell.brandLabel.text = car.brandCar
        cell.modelLabel.text = car.modelCar
        cell.dateLabel.text = "\(car.dateCar)"
            
        return cell
        
     }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createNewCarSegue" {
        let nextVC = segue.destination as! ViewController
            nextVC.delegate = self
        } else if segue.identifier == "editCarSegue" {
            if let inddexPath = tableView.indexPathForSelectedRow {
                let nextVC = segue.destination as! ViewController
                nextVC.delegate = self
                nextVC.carEdit = cars[inddexPath.row]
            
            }
            let nextVC = segue.destination as! ViewController
            nextVC.delegate = self
        }
        
    }
    

    func onCreatedNew(car: Car) -> Void {
    cars.append(car)
        tableView.reloadData()
    }
    
    func onEdited(car: Car) -> Void {
        tableView.reloadData()
    }
    
    
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


