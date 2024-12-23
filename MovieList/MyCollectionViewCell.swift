//
//  MyCollectionViewCell.swift
//  MovieList
//
//  Created by Ferry jati on 04/12/24.
//

import UIKit
import SDWebImage
class MyCollectionViewCell: UICollectionViewCell {
  
  
  
  @IBOutlet weak var myImageView: UIImageView!
  
  
  static let identifier = "MyCollectionViewCell"
  var dataTo: [Title] = []
  var tapGesture : UITapGestureRecognizer!
  static func nib() -> UINib{
    return UINib(nibName: "MyCollectionViewCell", bundle: nil)
  }
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configure(with title: Title) {
    // Set gambar untuk imageView menggunakan SDWebImage
    if let posterPath = title.poster_path {
      let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
      myImageView.sd_setImage(with: url, completed: nil)
    } else {
      myImageView.image = UIImage(named: "") // Placeholder jika poster tidak ada
    }
  }
}
