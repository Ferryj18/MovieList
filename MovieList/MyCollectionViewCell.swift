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
//    tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
//          myImageView.addGestureRecognizer(tapGesture)
//          myImageView.isUserInteractionEnabled = true
//      }
//
//      @objc func imageTapped() {
//          // Memberitahukan view controller bahwa gambar ditekan
//        if let viewController = self.window?.rootViewController as? ViewController {
//              viewController.didTapImageInCell(cell: self)
//          }
//      }
  func configure(with title: Title) {
          // Set gambar untuk imageView menggunakan SDWebImage
          if let posterPath = title.poster_path {
              let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            myImageView.sd_setImage(with: url, completed: nil)
          } else {
            myImageView.image = UIImage(named: "") // Placeholder jika poster tidak ada
          }
      }
//  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailMovie") as? DetailMovieViewController{
//      self.present(vc, animated: true)
//      print("gotodetail")
//    }
//}
  }
//  struct MyCVCModel{
//    var title: String
//    var author: String
//    var date: String
//    var image: String
//    var url: String
//    init(title: String, author: String, date: String, image: String, url: String) {
//      self.title = title
//      self.author = author
//      self.date = date
//      self.image = image
//      self.url = url
//    }
//    
//  }
