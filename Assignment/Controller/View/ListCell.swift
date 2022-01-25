//
//  ListCell.swift
//  Assignment
//
//  Created by Amruta Warankar on 25/01/22.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var backView     : UIView!
    @IBOutlet weak var artistName   : UILabel!
    @IBOutlet weak var artistImage  : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backView.setShadow(clr: UIColor.black, sRadius: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var identifire : String {
        return String(describing: self)
    }
    
    func setListData(_ data : ListModel?){
        if let listData = data {
            artistName.text = listData.artistName
            self.artistImage.loadImageUsingCacheWithURLString(listData.artworkUrl100 ?? "", placeHolder: #imageLiteral(resourceName: "picture"))
        }
    }
}
