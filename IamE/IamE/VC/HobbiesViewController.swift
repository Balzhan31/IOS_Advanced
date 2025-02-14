//
//  HobbiesViewController.swift
//  IamE
//
//  Created by Балжан Бозбашава on 14.02.2025.
//

import UIKit

class HobbiesViewController: UIViewController {
    
    @IBOutlet weak var inforLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inforLabel.text = "I have a passion for hiking, as walking along mountain trails not only keeps me active but also inspires me with the beauty of nature. In my free time, I enjoy immersing myself in podcasts on a variety of topics—ranging from science and psychology to art and technology. It helps me broaden my horizons and discover new ideas. Reading books, for me, is a way to travel through time, explore different cultures, and simply enjoy well-crafted stories."
        inforLabel.layer.cornerRadius = 50
        inforLabel.clipsToBounds = true
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
