//
//  HomeScreenViewController.swift
//  Giggle_sb
//
//  Created by rjk on 06/11/24.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var flnTestButton: UIButton!
    @IBOutlet weak var gigsTableView: UITableView!
    
    var gigs: [Gig] = sampleGigs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gigsTableView.dataSource = self
        gigsTableView.delegate = self
        gigsTableView.rowHeight = UITableView.automaticDimension
//        gigsTableView.estimatedRowHeight = 150
        gigsTableView.rowHeight = 250
        

        // Do any additional setup after loading the view.
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return gigs.count
        }

    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GigCardCell", for: indexPath) as? GigCardCell else {
            return UITableViewCell()
        }
        
        // Configure cell with Gig data
        let gig = gigs[indexPath.row]
        cell.configure(with: gig)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
