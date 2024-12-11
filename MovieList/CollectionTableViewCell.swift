//
//  CollectionTableViewCell.swift
//  MovieList
//
//  Created by Ferry jati on 04/12/24.
//

import UIKit
protocol CollectionTableViewCellDelegate: AnyObject {
    func  collectionViewTableViewCellDidTapCell(_ cell: CollectionTableViewCell, viewModel: TitlePreviewViewModel)
}


class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
  
  
  static let identifier = "CollectionTableViewCell"
  weak var delegate: CollectionTableViewCellDelegate?
  static func nib() -> UINib{
    return UINib(nibName: "CollectionTableViewCell", bundle: nil)
  }
  
  
  func configure(with dataTo: [Title]) {
    self.dataTo = dataTo
    DispatchQueue.main.async { [weak self] in
    self?.collectionView.reloadData() // Make sure this is inside the closure
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      collectionView.deselectItem(at: indexPath, animated: true)
      let title = dataTo[indexPath.row]
      
      // Unwrap the original_title or original_name
      guard let titleName = title.original_title ?? title.original_name else {
        return
      }
      
      // Call the API and handle the result
      APICaller.shared.getMovie(with: titleName + " trailer") { [weak self] result in
        switch result {
        case .success(let videoElement):
          
          let title = self?.dataTo[indexPath.row]
          guard let titleOverview = title?.overview else {
            return
          }
          guard let strongSelf = self else {
            return
          }
          let viewModel = TitlePreviewViewModel(title: titleName, youtubeView: videoElement, titleOverview: titleOverview)
          self?.delegate?.collectionViewTableViewCellDidTapCell(strongSelf, viewModel: viewModel)
          
        case .failure(let error):
          print(error.localizedDescription)
        }
        
      }
    }
  }

