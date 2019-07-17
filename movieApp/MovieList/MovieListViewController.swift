//
//  MovieListViewController.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright (c) 2019 Carlos Torres Sanchez. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieListViewController: UIViewController {

    // MARK: - Public properties -
  @IBOutlet weak var searchButton: UIBarButtonItem!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet var movieSelectorOptions: [UISegmentedControl]!
  @IBOutlet weak var moviesTable: UITableView!
  var movies:Movies?
  var filteredMovies = [MovieResult]()
  var scopeTitles = ["Popular","Top Rated", "Upcoming"]
  var searchBarController:UISearchController?
  
  
  var presenter: MovieListPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.requestMovies(with: "popular")
     }
  
  @IBAction func searchMovies(_ sender: Any) {
    searchBarController?.hidesNavigationBarDuringPresentation = false
    searchBarController?.searchBar.placeholder = "Find Movies"
    searchBarController?.searchBar.scopeButtonTitles = scopeTitles
    searchBarController?.obscuresBackgroundDuringPresentation = false
    searchBarController?.searchBar.keyboardType = UIKeyboardType.asciiCapable
    searchBarController?.searchResultsUpdater = self
    self.searchBarController?.searchBar.delegate = self
    present(searchBarController!, animated: true, completion: nil)

  }
  
  func searchBarIsEmpty() -> Bool {
    return searchBarController?.searchBar.text?.isEmpty ?? true
  }
  
  func filterContentForSearchText(_ searchText: String, scope: String = "Upcoming") {
  
    self.title = scope
    filteredMovies = (movies?.results.filter({( movie : MovieResult) -> Bool in
     return movie.title.contains(searchText)
   }))!
    moviesTable.reloadData()
    
  }
	
}

// MARK: - Extensions -

extension MovieListViewController: MovieListViewInterface {
 
  func showMovies(with movies: Movies) {
    self.movies = movies
    searchButton.isEnabled = true
    moviesTable.delegate = self
    moviesTable.dataSource = self
    searchBarController = UISearchController(searchResultsController: nil)
    moviesTable.reloadData()
    
  }
  func isFiltering() -> Bool {
    return (searchBarController?.isActive)! && !searchBarIsEmpty()
  }
  
}

extension MovieListViewController:UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if isFiltering(){
      navigationController?.pushWireframe(MovieDetailWireframe(with: (filteredMovies[indexPath.row])))
      searchBarController?.isActive = false

    }
    else{
      navigationController?.pushWireframe(MovieDetailWireframe(with: (movies?.results[indexPath.row])!))
    }
  }
  
}


extension MovieListViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if isFiltering(){
      return filteredMovies.count
    }
    else{
    return (movies?.results.count)!
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell{
      
      if isFiltering(){
        cell.setMovieInCell(with: (filteredMovies[indexPath.row]))
        

      }else{
      cell.setMovieInCell(with: (movies?.results[indexPath.row])!)
      }
      return cell
      
    }
    else{
      return UITableViewCell()
    }
  }
  
  
  
  
}


extension MovieListViewController:UISearchResultsUpdating{
  func updateSearchResults(for searchController: UISearchController) {
    let scopeIndex = searchController.searchBar.selectedScopeButtonIndex

    self.filterContentForSearchText(searchController.searchBar.text!, scope: scopeTitles[scopeIndex] )
    
    
  }
  
  
}

extension MovieListViewController:UISearchBarDelegate{
  
 func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
  searchBarController?.isActive = false
  }
  
  
  
}
