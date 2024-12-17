//
//  TableViewController.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 08.12.2024.
//

import UIKit

class TableViewController: UITableViewController {
	
	var categoryManager: ICategoryManager!
	
	private let cellIdentifier = "cellIdentifier"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		250
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		categoryManager.getAllCategories().count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductCell else {
			return UITableViewCell()
		}
		
		let category = categoryManager.getAllCategories()[indexPath.row]
		
		cell.configure(categoryManager.getProductsInCategory(category.categoryTitle), categoryName: category.categoryTitle)
		cell.action = presentDetailsVC
		
		return cell
	}
	
	private func presentDetailsVC(_ id: Int) {
		guard let product = categoryManager.getProductWithId(id) else { return }
		let detailsVC = DetailsViewController()
		detailsVC.configure(product: product)
		present(detailsVC, animated: true)
	}
}

//MARK: - SetupView
private extension TableViewController {
	func setupView() {
		view.backgroundColor = .white
		tableView.separatorStyle = .none
		tableView.register(ProductCell.self, forCellReuseIdentifier: cellIdentifier)
	}
}
