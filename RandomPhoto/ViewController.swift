//
//  ViewController.swift
//  RandomPhoto
//
//  Created by xigua on 2022/9/18.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.ContentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemPurple,
        .systemRed,
        .systemGreen,
        .systemOrange
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y:0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y:view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)

    }
    
    func getRandomPhoto(){
        let urlString =
        "https://source.unsplash.com/random/600X600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url)  else{
            return
        }
        imageView.image = UIImage(data: data)
    }


}

