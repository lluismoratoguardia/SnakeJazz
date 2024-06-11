//
//  FilterView.swift
//  SnakeJazz
//
//  Created by Lluís Morató on 10/6/24.
//

import UIKit

enum FilterViewSectionType {
    case search
    case options(list: [String])
}
struct FilterViewSectionModel {
    let header: String
    let content: FilterViewSectionType
}
struct FilterViewModel {
    let sections: [FilterViewSectionModel]
    weak var delegate: FilterViewProtocol?
}

protocol FilterViewProtocol: AnyObject {
}

class FilterView: BaseView {
    class func showInView(_ view: UIView, model: FilterViewModel) {
        let filterView = FilterView()
        filterView.setup(model)
        filterView.frame = view.bounds
        view.addSubview(filterView)
    }
    
    @IBOutlet private weak var filterCollectionView: UICollectionView!
    
    private var model: FilterViewModel?
    
    func setup(_ model: FilterViewModel) {
        self.model = model
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupCollectionView() {
        filterCollectionView.registerHeader(FilterViewSectionHeaderCollectionReusableView.self)
        filterCollectionView.register(FilterViewSearchCollectionViewCell.self)
        filterCollectionView.register(FilterViewOptionCollectionViewCell.self)
    }
}

extension FilterView: UICollectionViewDelegate {
}

extension FilterView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model?.sections.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let model = model else {
            return 0
        }
        
        switch model.sections[section].content {
        case .search:
            return 1
        case .options(let list):
            return list.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = model else {
            return UICollectionViewCell()
        }
        
        switch model.sections[indexPath.section].content {
        case .search:
            let cell: FilterViewSearchCollectionViewCell = collectionView.dequeueCell(indexPath)
            return cell
        case .options(let list):
            let cell: FilterViewOptionCollectionViewCell = collectionView.dequeueCell(indexPath)
            cell.setup(FilterViewOptionCollectionViewCellModel(title: list[indexPath.row]))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let model = model else {
            return UICollectionReusableView()
        }
        
        let view: FilterViewSectionHeaderCollectionReusableView = collectionView.dequeueHeader(indexPath)
        view.setup(FilterViewSectionHeaderCollectionReusableViewModel(title: model.sections[indexPath.section].header))
        
        return view
    }
}

extension FilterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let model = model else {
            return CGSize()
        }
        
        switch model.sections[indexPath.section].content {
        case .search:
            let cvRect = collectionView.frame
            return CGSize(width: cvRect.width, height: 50)
        case .options(let list):
            let item = list[indexPath.row]
            let itemTextSize = item.size(withAttributes:[.font: Fonts.defaultText])
            return CGSize(width: itemTextSize.width + 35, height: 40)
        }
    }
}
