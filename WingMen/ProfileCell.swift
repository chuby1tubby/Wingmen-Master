
import UIKit

class NameCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ name: String) {
        nameLbl.text = name
    }
}
