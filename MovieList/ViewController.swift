//
//  ViewController.swift
//  MovieList
//
//  Created by Ferry jati on 04/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  enum Sections: Int {
      case TrendingMovies = 0
      case Popular = 1
      case Upcoming = 2
      case TopRated = 3
  }

  @IBOutlet weak var table: UITableView!
  let sectionHeaders = ["Trending Movies", "Popular Movies","Upcoming","Top Rated"]

  var dataTo = [Title]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getTrendingMovies()
    
    

    table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
    table.delegate = self
    table.dataSource = self
  }
  private func getTrendingMovies() {
      APICaller.shared.getTrendingMovies { [weak self] result in
          switch result {
          case .success(let titles):
              print("Received Titles: \(titles)") // Add this line to verify the response
              // Proceed with handling the titles
              DispatchQueue.main.async {
                  self?.dataTo = titles // Set the data to models
                  self?.table.reloadData() // Reload table view
              }
          case .failure(let error):
              print("Error: \(error.localizedDescription)") // Log the error
          }
      }
  }

    
  // table
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionHeaders.count
      }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
   
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
    
    cell.configure(with: dataTo)
    switch indexPath.section {
            case Sections.TrendingMovies.rawValue:
                APICaller.shared.getTrendingMovies { result in
                    switch result {
                        
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
    
            case Sections.Popular.rawValue:
                APICaller.shared.getPopular { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            case Sections.Upcoming.rawValue:
                
                APICaller.shared.getUpcomingMovies { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                
            case Sections.TopRated.rawValue:
                APICaller.shared.getTopRated { result in
                    switch result {
                    case .success(let titles):
                        cell.configure(with: titles)
                    case .failure(let error):
                        print(error)
                    }
                }
            default:
                return UITableViewCell()

            }
            
            return cell
        }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250.0
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let headerView = UIView()
      let label = UILabel()

      // Set label text dari section header
    label.text = sectionHeaders[section]

      // Set font dan ukuran sesuai kebutuhan
      label.font = UIFont.systemFont(ofSize: 18, weight: .bold) // Ganti dengan font yang diinginkan
      label.textColor = .black // Ganti dengan warna yang diinginkan

      // Add label ke header view
      label.translatesAutoresizingMaskIntoConstraints = false
      headerView.addSubview(label)

      // Set constraint untuk label agar tampil dengan benar
      NSLayoutConstraint.activate([
          label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
          label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
          label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15)
      ])
      
      // Styling untuk header view (opsional)
      headerView.backgroundColor = .white // Menambahkan warna latar belakang pada header

      return headerView
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 50.0 // Tinggi header yang disesuaikan
  }
}

//struct Model{
//  let text: String
//  let imageName: String
//  
//  init(text: String, imageName: String) {
//    self.text = text
//    self.imageName = imageName
//  }
//}

