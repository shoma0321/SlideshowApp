//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 伊藤 奨真 on 2022/05/06.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var imageView2: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView2.image = image
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
