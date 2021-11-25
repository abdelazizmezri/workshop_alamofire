//
//  AddViewController.swift
//  workshopTableView
//
//  Created by Abdelaziz Mezri on 11/6/21.
//

import UIKit
import Alamofire

class AddViewController: UIViewController {
    
    @IBOutlet weak var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if(textFieldName.text != ""){
            addMovie(name: textFieldName.text!)
            self.navigationController?.popViewController(animated: true)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }else{
            let alert = UIAlertController(title: "Warning", message: "You must put a name for the movie", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    func addMovie(name: String) {
        let url = "http://localhost:3000/add"
        
        let params: Parameters = [
            "name": name
        ]
        
        AF.request(url, method: .get,parameters: params)
            .validate()
            .responseJSON { response in
                switch response.result {
                    case .success:
                        print("Validation Successful")
                    case .failure(let error):
                        print(error)
                }
            }
    }

}
