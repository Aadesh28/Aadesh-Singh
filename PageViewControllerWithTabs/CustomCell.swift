import UIKit

class CustomCell: UITableViewCell
{

    @IBOutlet weak var lblEvent: UILabel!
    
    
    @IBOutlet weak var lblTime: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

    
}
