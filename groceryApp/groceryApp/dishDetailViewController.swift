import UIKit

class dishDetailViewController: UIViewController {
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var dishDuration: UILabel!
    @IBOutlet weak var dishHardness: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishDesc: UITextView!
    
    var dishName = ""
    var timing = ""
    var hardness = ""
    var desc = ""
    var image: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishTitle.text? = dishName
        dishDuration.text? = timing
        dishHardness.text? = hardness
        dishDesc.text? = desc
        dishImage.image = UIImage(data: image)
        
        dishImage.layer.cornerRadius = 5
    }

}
