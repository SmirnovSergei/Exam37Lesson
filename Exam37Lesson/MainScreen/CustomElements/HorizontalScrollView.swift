//
//  HorizontalScrollView.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 12.12.2024.
//

import UIKit

class HorizontalScrollView: UIView {
	
	var action: ((Int) -> ())?
	
	private let scrollView = UIScrollView()
	private let stackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with products: [Product]) {
		for product in products {
			let view = CustomView(product: product)
			view.configure(product: product)
			view.action = tapView
			stackView.addArrangedSubview(view)
		}
	}
	
	private func tapView(_ id: Int) {
		action?(id)
	}
}

//MARK: - SetupView
private extension HorizontalScrollView {
	func setupView() {
		scrollView.addSubview(stackView)
		addSubview(scrollView)
		
		setupStackView()
	}
	
	func setupStackView() {
		stackView.axis = .horizontal
		stackView.spacing = 10
	}
}

//MARK: - Layout
private extension HorizontalScrollView {
	func setupLayout() {
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
			stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
		])
	}
}
