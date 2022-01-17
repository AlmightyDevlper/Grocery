import UIKit

class dishesListCellTableViewCell: UITableViewCell {


    @IBOutlet var dishView: UIView!
    @IBOutlet var dishImgView: UIImageView!
    @IBOutlet var dishLbl: UILabel!
    @IBOutlet weak var dishDurationLbl: UILabel!
    @IBOutlet weak var dishLevelLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
