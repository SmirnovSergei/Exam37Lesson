//
//  ProductCell.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 12.12.2024.
//

import UIKit

class ProductCell: UITableViewCell {
	
	var action: ((Int) -> ())?
	
	private let categoryLabel = UILabel()
	private let horizontalScroll = HorizontalScrollView()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(_ products: [Product], categoryName: String) {
		setupCategoryLabel()
		categoryLabel.text = categoryName
		horizontalScroll.configure(with: products)
		horizontalScroll.action = throwActionInVC
	}
	
	private func throwActionInVC(_ id: Int) {
		action?(id)
	}
}

//MARK: - Setting
private extension ProductCell {
	func setup() {
		contentView.addSubview(categoryLabel)
		contentView.addSubview(horizontalScroll)
		setupLayout()
	}
	
	func setupCategoryLabel() {
		categoryLabel.textColor = .black
		categoryLabel.font = .boldSystemFont(ofSize: 20)
	}
}

//MARK: - Layout
private extension ProductCell {
	func setupLayout() {
		categoryLabel.translatesAutoresizingMaskIntoConstraints = false
		horizontalScroll.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			categoryLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
			categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			
			horizontalScroll.topAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 20),
			horizontalScroll.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
			horizontalScroll.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
			horizontalScroll.heightAnchor.constraint(equalToConstant: 220)
		])
	}
}
