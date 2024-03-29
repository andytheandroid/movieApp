//
//  MovieListWireframe.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright (c) 2019 Carlos Torres Sanchez. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MovieListWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "MovieList", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MovieListViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = MovieListInteractor()
      let presenter = MovieListPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MovieListWireframe: MovieListWireframeInterface {
}
