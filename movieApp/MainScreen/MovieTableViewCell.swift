//
//  MovieTableViewCell.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/27/19.
//  Copyright © 2019 Carlos Torres Sanchez. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

  @IBOutlet weak var movieName: UILabel!
  @IBOutlet weak var releaseDate: UILabel!
 
  @IBOutlet weak var movieImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func setMovieInCell(with movie:MovieResult){
    let downloadManager = DownloadManager()
   downloadManager.delegate = self
    downloadManager.startDownload(from: URL(string: "https://image.tmdb.org/t/p/w200/"+movie.poster_path)!)
    movieName.text = movie.title
    releaseDate.text = movie.release_date
    
    
    
  }

  
}

extension MovieTableViewCell: DownloadManagerDelegate{
  func didDownloadImage(_: DownloadManager, data: Data) {
    movieImage.image = UIImage(data: data)
  }
  
  
}
