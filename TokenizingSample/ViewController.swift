//
//  ViewController.swift
//  TokenizingSample
//
//  Created by Panfilo Mariano on 3/14/17.
//  Copyright © 2017 Panfilo Mariano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var  addedRecipientColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
    fileprivate var  toBeDeletedRecipientColor = UIColor.red.withAlphaComponent(0.8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tokenView = KSTokenView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 50))
        tokenView.delegate = self
        tokenView.promptText = "  To: "
        tokenView.placeholder = "Add Recipient"
        tokenView.descriptionText = "others"
        tokenView.maxTokenLimit = 1000
        tokenView.style = .squared
        tokenView.maximumHeight = 120.0
        tokenView.paddingX = 10.0
        tokenView.minimumCharactersToSearch = 3
        tokenView.showSearchResultController = false
        tokenView.minWidthForInput = 100
        tokenView.font = UIFont.systemFont(ofSize: 12)
        tokenView.tokenizingCharacters = [","]
        tokenView.placeholderColor = UIColor.lightGray
        tokenView.cursorColor = addedRecipientColor
        tokenView.textColor = addedRecipientColor
        tokenView.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 244/255.0, alpha: 1)
        
        tokenView.layer.shadowColor = UIColor.black.cgColor
        tokenView.layer.shadowOffset = CGSize(width: 0, height:1)
        tokenView.layer.shadowOpacity = 0.5
        tokenView.layer.shadowRadius = 1
        tokenView.clipsToBounds = false
        
        view.addSubview(tokenView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: KSTokenViewDelegate {
    func tokenView(_ token: KSTokenView, performSearchWithString string: String, completion: ((_ results: Array<AnyObject>) -> Void)?) {
    
    }
    
    func tokenView(_ token: KSTokenView, displayTitleForObject object: AnyObject) -> String {
        return "displayTitleForObject"
    }
    
    func tokenView(_ tokenView: KSTokenView, shouldChangeAppearanceForToken token: KSToken) -> KSToken? {
        token.tokenBackgroundHighlightedColor = toBeDeletedRecipientColor
        token.tokenBackgroundColor = addedRecipientColor
        token.tokenTextColor = UIColor.white
        token.font = UIFont.systemFont(ofSize: 12)
        
        return token
    }
}
