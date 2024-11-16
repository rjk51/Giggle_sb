//
//  SearchViewController.swift
//  Giggle_sb
//
//  Created by rjk on 12/11/24.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var filteredGigs: [Gig] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GigCardViewCell", bundle: nil), forCellReuseIdentifier: "GigCardViewCell")
        
        // Optionally, you can set up a target action for the text fields to perform the search
        jobTextField.addTarget(self, action: #selector(searchGigs), for: .editingChanged)
        locationTextField.addTarget(self, action: #selector(searchGigs), for: .editingChanged)
    }

    @objc func searchGigs() {
        // Get input from text fields
        let jobInput = jobTextField.text?.lowercased() ?? ""
        let locationInput = locationTextField.text?.lowercased() ?? ""

        // Filter the sampleGigs array
        filteredGigs = sampleGigs.filter { gig in
            let matchesJob = gig.title.lowercased().contains(jobInput) || jobInput.isEmpty
            let matchesLocation = gig.location.lowercased().contains(locationInput) || locationInput.isEmpty
            return matchesJob && matchesLocation
        }

        // Reload the table view to display the filtered results
        tableView.reloadData()
    }

    // MARK: - UITableView DataSource and Delegate Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGigs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GigCardViewCell", for: indexPath) as? GigCardViewCell else {
            return UITableViewCell()
        }

        let gig = filteredGigs[indexPath.row]
        cell.configure(with: gig)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle gig selection if needed
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
