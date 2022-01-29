import UIKit

class dishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishLbl: UILabel!
    
    var dishName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishLbl.text = dishName
        // Do any additional setup after loading the view.
    }

}
