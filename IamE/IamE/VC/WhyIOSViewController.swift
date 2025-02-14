//
//  WhyIOSViewController.swift
//  IamE
//
//  Created by Балжан Бозбашава on 14.02.2025.
//

import UIKit

class WhyIOSViewController: UIViewController {
    
    @IBOutlet weak var InfLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        InfLabel.text = "I chose iOS Advanced because I want to get better at building apps for Apple devices. I already know the basics, so now I want to learn more about how to make apps faster, smoother, and more powerful. I also like how Apple’s system works, and I want to create apps that look and feel great. Plus, knowing advanced iOS development opens up more career opportunities, so it’s a useful skill to have."
        InfLabel.layer.cornerRadius = 50
        InfLabel.clipsToBounds = true
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
