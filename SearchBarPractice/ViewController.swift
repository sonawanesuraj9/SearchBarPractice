//
//  ViewController.swift
//  SearchBarPractice
//
//  Created by Suraj MAC2 on 2/19/16.
//  Copyright © 2016 supaint. All rights reserved.
//

import UIKit

class recipeTableViewCell : UITableViewCell{
    
    
    //Controlls
    
    @IBOutlet weak var lblRecipeName: UILabel!
    
    @IBOutlet weak var lblRecipeTime: UILabel!
    @IBOutlet weak var imgRecipe: UIImageView!
    
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate {

    
    //General
    var recipeNameArray : NSArray = NSArray()
    //[String] = ["Biryani","Chikan Masala","Chikan Korma","Chiken Fry","Boiled EGG","Mutton Thali","Chicken Munchurian","Chikan 65","Chicken Soup"]
    var recipeTimeArray : NSArray = NSArray()
    //[String] = ["1h 30m","2h 25m","35m","50m","10m","1h 50m","2h 25m","70m","15m"]
    
    
    var searchResult : NSArray = NSArray()
    //Controlls
    
    @IBOutlet weak var tblMain: UITableView!
    @IBOutlet weak var searchControl: UISearchBar!
    
    
    //Let's Play
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        recipeNameArray = ["Biryani","Chikan Masala","Chikan Korma","Chiken Fry","Boiled EGG","Mutton Thali","Chicken Munchurian","Chikan 65","Chicken Soup"]
        recipeTimeArray = ["1h 30m","2h 25m","35m","50m","10m","1h 50m","2h 25m","70m","15m"]
    }

    
    
    //UITableViewDatasource Method Implementation
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return recipeNameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath) as! recipeTableViewCell
        
        cell.imgRecipe.image = UIImage(named: "products")
        cell.lblRecipeName.text = recipeNameArray[indexPath.row] as? String
        cell.lblRecipeTime.text = recipeTimeArray[indexPath.row] as? String
        return cell
        
    }
    
    func filterContentForSearchText(searchText:NSString, scopes scope:NSString)
    {
        //var searchText = ""
        
        let resultPredicate : NSPredicate = NSPredicate(format: "name contains[c]\(searchText)", argumentArray: nil)
        
        //var recipes : NSArray = NSArray()
        
        searchResult = recipeNameArray.filteredArrayUsingPredicate(resultPredicate)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

