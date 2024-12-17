//
//  CustomView.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 12.12.2024.
//

import UIKit

class CustomView: UIView {
	
	var action: ((Int) -> ())?
	
	private let titleLabel = UILabel()
	private let descriptionLabel = UILabel()
	private let priceLabel = UILabel()
	
	private let productImage = UIImageView()
	
	private var product: Product?
	
	init(product: Product) {
		super.init(frame: .zero)
		self.product = product
		setup()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		action?(product?.id ?? 0)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 20)
		layer.shadowPath = shadowPath.cgPath
	}
	
	func configure(product: Product) {
		titleLabel.text = product.title
		descriptionLabel.text = product.description
		priceLabel.text = "\(product.price)₽"
		productImage.image = UIImage(named: product.imageName)
	}
}

//MARK: - Settings
private extension CustomView {
	func setup() {
		backgroundColor = UIColor(cgColor: CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1))
		layer.cornerRadius = 20
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.3
		layer.shadowOffset = CGSize(width: 5, height: 5)
		layer.shadowRadius = 10
		
		addSubviews()
		
		setupTitleLabel()
		setupDescription()
		setupPriceLabel()
		setupImageProduct()
	}
	
	func addSubviews() {
		[titleLabel,
		descriptionLabel,
		priceLabel,
		 productImage].forEach { view in
			addSubview(view)
		}
	}
	
	func setupTitleLabel() {
		titleLabel.font = .boldSystemFont(ofSize: 20)
	}
	
	func setupDescription() {
		descriptionLabel.numberOfLines = 0
	}
	
	func setupPriceLabel() {
		priceLabel.font = .systemFont(ofSize: 24)
	}
	
	func setupImageProduct() {
		productImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
		productImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
		productImage.contentMode = .scaleAspectFill
	}
}

//MARK: - Layout
private extension CustomView {
	func setupLayout() {
		[titleLabel,
		descriptionLabel,
		priceLabel,
		 productImage].forEach { view in
			view.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			productImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			
			titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),

			descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
			descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			descriptionLabel.widthAnchor.constraint(equalToConstant: 170),
			
			priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
			priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
		])
	}
}
