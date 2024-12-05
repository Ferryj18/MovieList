//
//  CollectionTableViewCell.swift
//  MovieList
//
//  Created by Ferry jati on 04/12/24.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
 
  
  static let identifier = "CollectionTableViewCell"
  
  static func nib() -> UINib{
    return UINib(nibName: "CollectionTableViewCell", bundle: nil)
  }
  
  func configure(with dataTo: [Title]) {
      self.dataTo = dataTo
      DispatchQueue.main.async {
          self.collectionView.reloadData() // Make sure this is inside the closure
      }
  }

  @IBOutlet weak var collectionView: UICollectionView!
  
  var dataTo = [Title]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
      collectionView.delegate = self
      collectionView.dataSource = self
    }
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   //CollectionView
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataTo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
    let title = dataTo[indexPath.row] // Ambil data dari array dataTo
        cell.configure(with: title) // Berikan data ke cell
  return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
    return CGSize(width: 250, height: 250)
  }
    
}
