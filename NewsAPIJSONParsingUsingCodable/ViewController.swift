//  ViewController.swift
//  NewsAPIJSONParsingUsingCodable
//  Created by Ranjeet Raushan on 15/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NewsAPITableView: UITableView!
    var result: Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mark:-  JSON Parsing from URL
        /*  JSON Parsing from URL - starts here  */
        /*
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-11-14&sortBy=publishedAt&apiKey=92851e46e2a1479294ac8acb40eca458")
        /*
         parameters:
         q: bitcoin
         from: 2020-11-14
         sortBy: publishedAt
         apiKey: 92851e46e2a1479294ac8acb40eca458
         Note: This api will not work for long time , so you can change the api from newsapi.org and also change from and apiKey parameters .
         For that you have to login and need to get new apiKey . After that you will get new api .
         */
        URLSession.shared.dataTask(with: url!){ (data, response,error) in
            do{
                self.result =  try JSONDecoder().decode(Result.self, from: data!)
                DispatchQueue.main.async {
                    self.NewsAPITableView.reloadData()
                }
                print(self.result!)
            }
            catch{
                print("Error:\(error)")
            }
        }.resume()
        */
        /*  JSON Parsing from URL - ends  here  */
        
        // Mark:-  JSON Parsing from Local JSON Data
        /* JSON Parsing from Local JSON Data - starts here */
        
         guard let path = Bundle.main.path(
         forResource: "newsAPILocalData",
         ofType: "json") else { return}
         let url = URL(fileURLWithPath: path)
         do{
         let jsonData = try Data(contentsOf: url)
         self.result = try JSONDecoder().decode(Result.self, from: jsonData)
         print(result!)
         }
         catch{
         print("Error:\(error)")
         }
        
        /* JSON Parsing from Local JSON Data - ends here */
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.articles?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelData = result?.articles?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! NewsAPITableView
        //Mark:- Binding Text in a Table View cell
        cell.label1.text =  modelData?.author
        cell.label2.text =  modelData?.title
        cell.label3.text = modelData?.description
        cell.label4.text =  modelData?.url
        cell.label5.text = modelData?.urlToImage
        cell.label6.text = modelData?.publishedAt
        cell.label7.text =  modelData?.content
        
        
        
        //Mark:- Applying Background Color  in a Table View cell
        cell.label1.backgroundColor = UIColor.init(red: 180.0/255.0, green: 199.0/255.0, blue: 228.0/255.0, alpha: 1.0)
        cell.label2.backgroundColor = UIColor.init(red: 62.0/255.0, green: 225.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        cell.label3.backgroundColor = UIColor.init(red: 27.0/255.0, green: 104.0/255.0, blue: 196.0/255.0, alpha: 1.0)
        cell.label4.backgroundColor = UIColor.init(red: 255.0/255.0, green: 57.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        cell.label5.backgroundColor = UIColor.init(red: 228.0/255.0, green: 180.0/255.0, blue: 23.0/255.0, alpha: 1.0)
        cell.label6.backgroundColor = UIColor.init(red: 235.0/255.0, green: 73.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        cell.label7.backgroundColor = UIColor.init(red: 52.0/255.0, green: 229.0/255.0, blue: 89.0/255.0, alpha: 1.0)
        
        return cell
    }
    
}
