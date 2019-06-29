//
//  NewScreenPresenter.swift
//  movieApp
//
//  Created by Carlos Torres Sanchez on 6/26/19.
//  Copyright (c) 2019 Carlos Torres Sanchez. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class NewScreenPresenter {

    // MARK: - Private properties -

    private unowned let view: NewScreenViewInterface
    private let interactor: NewScreenInteractorInterface
    private let wireframe: NewScreenWireframeInterface

    // MARK: - Lifecycle -

    init(view: NewScreenViewInterface, interactor: NewScreenInteractorInterface, wireframe: NewScreenWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        NewScreenInteractor.presenterDelegate = self
      
    }
}

// MARK: - Extensions -

extension NewScreenPresenter: NewScreenPresenterInterface {
  func requestMovies(with category: String) {
    interactor.requestMovies(with: category)
  }
  
}

extension NewScreenPresenter:NewScreenInteractorOutputDelegate{
  func onMoviesFetched(with movies: Movies) {
    view.showMovies(with: movies)
  }
  
  
}
