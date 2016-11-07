
import UIKit
import Foundation

class mainTabbedPanel: UIViewController, UINavigationBarDelegate {

    
    var varView = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBarButton.target = self.revealViewController()
        btnBarButton.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    
    


    @IBOutlet weak var btnBarButton: UIBarButtonItem!
 

}
