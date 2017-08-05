//
//  AddNewCarDelegate.swift
//  practice_3
//
//  Created by Anton Lebedev on 16.07.17.
//  Copyright © 2017 Anton Lebedev. All rights reserved.
//

import Foundation

protocol AddNewCarDelegate {
    
    func onCreatedNew(car: Car) -> Void
    func onEdited(car: Car) -> Void
    
}
