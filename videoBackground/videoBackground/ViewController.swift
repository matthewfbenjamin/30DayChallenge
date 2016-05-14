

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButtonOutlet: UIButton!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBOutlet weak var webViewBG: UIWebView!
    
    override func viewDidLoad() {
        let filePath = NSBundle.mainBundle().pathForResource("planet", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        
        //let webViewBG = UIWebView(frame: self.view.frame)
        webViewBG.scalesPageToFit = true
        webViewBG.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
        webViewBG.userInteractionEnabled = false;
        self.view.addSubview(webViewBG)
        
        let filter = UIView()
        filter.frame = self.view.frame
        filter.backgroundColor = UIColor.blackColor()
        filter.alpha = 0.05
        self.view.addSubview(filter)
        
        
        logInButtonOutlet.titleLabel!.numberOfLines = 1;
        logInButtonOutlet.titleLabel!.adjustsFontSizeToFitWidth = true;
        
        self.view.addSubview(logInButtonOutlet)
        self.view.addSubview(signUpButtonOutlet)

    }
    
    
    
}