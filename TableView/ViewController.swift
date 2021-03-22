//
//  ViewController.swift
//  TableView
//
//  Created by Almas Nurzhanov on 17.03.2021.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    var name = ""
    var surname = ""
    var image = ""
    
    override func viewDidLoad() {//dannye pri zagruzke pervaya ispolnyatsa ori zagruzke ekrana
        super.viewDidLoad()
       
        Label1.text = name
        Label2.text = surname
        Image.image = UIImage(named:image)
    }


}

