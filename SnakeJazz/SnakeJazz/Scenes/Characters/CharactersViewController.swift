//
//  CharactersViewController.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 6/6/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CharactersDisplayLogic: AnyObject {
    func displayCharacters(_ characters: [CharactersViewModel.Character])
    func displayPagination(_ pagination: CharactersViewModel.PaginationInformation)
}

class CharactersViewController: BaseViewController {
    @IBOutlet private weak var listButton: UIButton!
    @IBOutlet private weak var gridButton: UIButton!
    @IBOutlet private weak var charactersTableView: UITableView!
    @IBOutlet private weak var charactersCollectionView: UICollectionView!
    @IBOutlet private weak var paginationView: PaginationView!
    
    private var characters = [CharactersViewModel.Character]()
    private var charactersDisplayMode: CharactersDisplayModeOptions = .list {
        didSet {
            updateCharacters()
        }
    }
    
    private enum CharactersDisplayModeOptions {
        case list
        case grid
    }
    
    var interactor: CharactersBusinessLogic?
    var router: (NSObjectProtocol & CharactersRoutingLogic & CharactersDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CharactersInteractor()
        let presenter = CharactersPresenter()
        let router = CharactersRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoadingIndicator()
        interactor?.getCharacters()
    }
    
    // MARK: View Setup
    
    private func setupView() {
        addFilterButton()
        setupCharactersTableView()
        setupCharactersCollectionView()
        
        title = String(localized: "characters_title")
        view.backgroundColor = Colors.backgroundColor
    }
    
    private func addFilterButton() {
        let filterImage = UIImage(systemName: "line.3.horizontal.decrease.circle")
        let filterButtonItem = UIBarButtonItem(image: filterImage, style: .plain, target: self, action: #selector(filterTouchUp))
        
        navigationItem.setRightBarButton(filterButtonItem, animated: true)
    }
    
    @IBAction private func filterTouchUp() {
        print("filtering!")
    }
    
    private func setupCharactersTableView() {
        charactersTableView.register(CharactersTableViewCell.nib(), forCellReuseIdentifier: CharactersTableViewCell.reuseIdentifier())
    }
    
    private func setupCharactersCollectionView() {
        charactersCollectionView.register(CharactersCollectionViewCell.nib(), forCellWithReuseIdentifier: CharactersCollectionViewCell.reuseIdentifier())
        if let collectionViewLayout = charactersCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    // MARK: Actions
    
    @IBAction private func listButtonTouchUp() {
        listButton.isSelected = true
        gridButton.isSelected = false
        charactersDisplayMode = .list
    }
    
    @IBAction private func gridButtonTouchUp() {
        listButton.isSelected = false
        gridButton.isSelected = true
        charactersDisplayMode = .grid
    }
    
    private func updateCharacters() {
        switch charactersDisplayMode {
        case .grid:
            charactersTableView.isHidden = true
            charactersCollectionView.isHidden = false
        case .list:
            charactersTableView.isHidden = false
            charactersCollectionView.isHidden = true
        }
        
        charactersTableView.reloadData()
        charactersCollectionView.reloadData()
    }
}

extension CharactersViewController: PaginationViewProtocol {
    func getPreviousPage() {
        showLoadingIndicator()
        interactor?.getPreviousCharacters()
    }
    
    func getNextPage() {
        showLoadingIndicator()
        interactor?.getNextCharacters()
    }
}

extension CharactersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersDisplayMode == .list ? characters.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.reuseIdentifier()) as? CharactersTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(CharactersTableViewCellModel(name: characters[indexPath.row].name))
        
        return cell
    }
}

extension CharactersViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersDisplayMode == .grid ? characters.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.reuseIdentifier(), for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(CharactersCollectionViewCellModel(portraitUrl: characters[indexPath.row].image, name: characters[indexPath.row].name))
        
        return cell
    }
}

extension CharactersViewController: CharactersDisplayLogic {
    func displayCharacters(_ characters: [CharactersViewModel.Character]) {
        self.characters = characters
        updateCharacters()
        dismissLoadingIndicator()
    }
    
    func displayPagination(_ pagination: CharactersViewModel.PaginationInformation) {
        paginationView.setup(PaginationViewModel(currentPage: pagination.currentPage, totalPages: pagination.numberOfPages, delegate: self))
        dismissLoadingIndicator()
    }
}
