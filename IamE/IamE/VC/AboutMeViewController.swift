//
//  AboutMeViewController.swift
//  IamE
//
//  Created by Балжан Бозбашава on 14.02.2025.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var Image: UIImage!
    @IBOutlet weak var MyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoLabel.text = "Hallo, my name is Balzhan. I am 3rd year student at KBTU. "
        infoLabel.layer.cornerRadius = 50
        infoLabel.clipsToBounds = true
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
