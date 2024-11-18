//
//  AllGigsViewController.swift
//  Giggle_sb
//
//  Created by rjk on 18/11/24.
//

import UIKit

class AllGigsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var gigs: [Gig] = sampleGigs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GigCardViewCell", bundle: nil), forCellReuseIdentifier: "GigCardViewCell")

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.gigs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GigCardViewCell", for: indexPath) as? GigCardViewCell else {
            return UITableViewCell()
        }
        
        // Configure cell with Gig data
        let gig = gigs[indexPath.section]
        cell.configure(with: gig)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell selected at section \(indexPath.section)")
            
        let gig = gigs[indexPath.section]
        
        // Instantiate GigDetailsViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let gigDetailsVC = storyboard.instantiateViewController(withIdentifier: "GigDescriptionViewController") as? GigDescriptionViewController {
            gigDetailsVC.gig = gig
            navigationController?.pushViewController(gigDetailsVC, animated: true)
        } else {
            print("Could not instantiate GigDescriptionViewController")
        }
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
