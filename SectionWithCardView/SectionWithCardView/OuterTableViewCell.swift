//
//  OuterTableViewCell.swift
//  SectionWithCardView
//
//  Created by Guest1 on 25/02/21.
//

import UIKit

class OuterTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var innerTableView: UITableView? {
        didSet {
            self.innerTableView?.delegate = self
            self.innerTableView?.dataSource = self
            self.innerTableView?.layer.cornerRadius = 10
            self.innerTableView?.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var baseView: UIView? {
        didSet {
            baseView?.layer.cornerRadius = 20.0
            baseView?.layer.shadowColor = UIColor.lightGray.cgColor
            baseView?.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            baseView?.layer.shadowRadius = 12.0
            baseView?.layer.shadowOpacity = 0.3
        }
    }
    
    @IBOutlet weak var headingLabel : UILabel? {
        didSet {
            headingLabel?.text = "Profile"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InnerTableViewCell", for: indexPath) as? InnerTableViewCell
        cell?.dataLabel.text = "Baqal"
        return cell!
    }
    
}
