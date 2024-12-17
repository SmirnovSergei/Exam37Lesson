//
//  DetailsViewController.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 17.12.2024.
//

import UIKit

class DetailsViewController: UIViewController {
	
	private let productImage = UIImageView()
	private let descriptionLabel = UILabel()
	private let priceLabel = UILabel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}
	
	func configure(product: Product?) {
		productImage.image = UIImage(named: product?.imageName ?? "")
		descriptionLabel.text = product?.description
		priceLabel.text = "\(product?.price ?? 0)₽"
	}
}

//MARK: - Settings
private extension DetailsViewController {
	func setupViews() {
		view.backgroundColor = UIColor(cgColor: CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1))
		
		addSubviews()
	}
	
	func addSubviews() {
		[productImage,
		descriptionLabel,
		priceLabel].forEach { subview in
			view.addSubview(subview)
		}
		
		setupProductImage()
		setupLabels()
	}
	
	func setupProductImage() {
		productImage.layer.cornerRadius = 20
		productImage.clipsToBounds = true
		productImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
		productImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
		productImage.contentMode = .scaleAspectFill
	}
	
	func setupLabels() {
		descriptionLabel.numberOfLines = 0
		descriptionLabel.textAlignment = .center
		
		priceLabel.font = .boldSystemFont(ofSize: 20)
		priceLabel.textAlignment = .center
	}
}

//MARK: - Layout
private extension DetailsViewController {
	func setupLayout() {
		[productImage,
		descriptionLabel,
		 priceLabel].forEach { view in
			view.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			productImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
			productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			descriptionLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
			descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			
			priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
			priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}
