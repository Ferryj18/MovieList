//
//  DetailMovieVC.swift
//  MovieList
//
//  Created by Ferry jati on 23/12/24.
//

import UIKit
import WebKit

class DetailMovieVC: UIViewController {
  
  
  @IBOutlet weak var webView: WKWebView!
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblOverview: UILabel!
  
  private var viewModel: TitlePreviewViewModel?

      override func viewDidLoad() {
          super.viewDidLoad()
        view.backgroundColor = .black
               // Mengatur teks UILabel menjadi putih
               lblTitle.textColor = .white
               lblOverview.textColor = .white
          // Configure the UI after the view is loaded
          configureUI()
      }
      
      // Method to set up the view model
      public func configure(with model: TitlePreviewViewModel) {
          self.viewModel = model
      }
      
      // Update the UI elements
      private func configureUI() {
          guard let viewModel = viewModel else {
              print("ViewModel is nil")
              return
          }

          // Set text for labels
          lblTitle.text = viewModel.title
          lblOverview.text = viewModel.titleOverview
          
          // Safely load YouTube video
          if let videoId = viewModel.youtubeView.id.videoId {
              let urlString = "https://www.youtube.com/embed/\(videoId)"
              if let url = URL(string: urlString) {
                  let request = URLRequest(url: url)
                  webView.load(request)
              } else {
                  print("Invalid YouTube URL: \(urlString)")
              }
          } else {
              print("Invalid video ID")
          }

          // Optional: Enable developer extras for debugging
          webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
      }
  }
  
