//
//  MainTableViewController.swift
//  DiatozAssignment
//
//  Created by Sambit Das on 19/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit



struct Value: Codable{
    var data: [jsonstruct]
    var status: String
    
}


struct jsonstruct:Codable {
    let id : String
    let employee_name:String
    let employee_salary:String
    let employee_age : String
   
}

class MainTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrdata: Value?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            getdata()
       
    }
    
    func getdata(){
        let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil, let data = data{
                do{
                    print(String(data: data, encoding: .utf8) as Any)
                    self.arrdata = try JSONDecoder().decode(Value.self, from: data)
                    
                    DispatchQueue.main.async {
                       self.tableView.reloadData()
        
                    }
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }.resume()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata?.data.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        if let emp = arrdata?.data[indexPath.row]{
        cell.idLbl.text = "Id : \(emp.id)"
        cell.NameLbl.text = "Name : \(emp.employee_name)"
        cell.salaryLbl.text = "Salary :\(emp.employee_salary)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detail = self.storyboard?.instantiateViewController(withIdentifier: "detailsView") as! DetailsViewController
        
        detail.id1 = "ID :\(arrdata!.data[indexPath.row].id)"
        print(detail.id1)
        detail.name1 = "Name :\(arrdata!.data[indexPath.row].employee_name)"
        detail.salary1 = "Salary :\(arrdata!.data[indexPath.row].employee_salary)"
        detail.age1 = "Age :\(arrdata!.data[indexPath.row].employee_age)"
      //self.present(detail, animated: true, completion: nil)
        self.navigationController?.pushViewController(detail, animated: true)
    }

}

