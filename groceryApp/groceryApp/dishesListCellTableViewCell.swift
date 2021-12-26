import UIKit

class dishesListCellTableViewCell: UITableViewCell {


    @IBOutlet var dishView: UIView!
    @IBOutlet var dishImgView: UIImageView!
    @IBOutlet var dishLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
