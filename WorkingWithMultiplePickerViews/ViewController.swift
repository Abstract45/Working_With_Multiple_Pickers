//
//  ViewController.swift
//  WorkingWithMultiplePickerViews
//
//  Created by Miwand Najafe on 2015-11-28.
//  Copyright © 2015 Miwand Najafe. All rights reserved.
//

import UIKit


class ViewController: UIViewController, AKPickerViewDataSource, AKPickerViewDelegate {
    @IBOutlet var picker1: AKPickerView!
 @IBOutlet var picker2: AKPickerView!
  
    var myArray1 = [0,1,2,3,4,5,6]
    var myArray2 = ["70%","75%","80%","85%","90%","95%"]
    
    var myArray3 = [String]()
    var defaultVal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.picker1.delegate = self
        self.picker1.dataSource = self
     
        
        self.picker2.delegate = self
        self.picker2.dataSource = self
        self.picker1.pickerViewStyle = AKPickerViewStyle.Wheel
        self.picker2.pickerViewStyle = AKPickerViewStyle.Wheel
        
        self.picker1.reloadData()
       

        
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
                // Do not add a duplicate element.
            }
            else {
                // Add value to the set.
                encountered.insert(value)
                // ... Append the value.
                result.append(value)
            }
        }
        return result
    }
    
    func pickerView(pickerView: AKPickerView, didSelectItem item: Int) {
        if (pickerView == picker1) {
            defaultVal = myArray1[item]
           
            for index in 0..<defaultVal {
               
                myArray3.append(myArray2[index])
     
            }
           
            picker2.reloadData()
        }
    }
    
    func selectNum(value: Int) -> Int {
        switch value {
        case 0:
            
            return 0
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 3
        case 4:
            return 4
        case 5:
            return 5
        case 6:
            return 6

        default:
            return 0
        }
    }
    
    
   func numberOfItemsInPickerView(pickerView: AKPickerView) -> Int {
        if (pickerView == picker1) {
           return myArray1.count
        }
        if (pickerView == picker2) {
            
           let val = selectNum(defaultVal)
          
            return val
            
        }
        return 0
    }
    
    
    func pickerView(pickerView: AKPickerView, titleForItem item: Int) -> String{
        if (pickerView == picker1) {
           return String(myArray1[item])
        }
        if (pickerView == picker2) {
            var myValues = removeDuplicates(myArray3)
            
            return myValues[item]
            
            
           
           
            
            
        }
        return "what"
    }
  

}

