//
//  CategoryManager.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 15.12.2024.
//

import Foundation

protocol ICategoryManager {
	func addCategories(_ categories: [Category])
	func getAllCategories() -> [Category]
	func getProductsInCategory(_ categoryName: String) -> [Product]
	func getProductWithId(_ id: Int) -> Product?
}

class CategoryManager: ICategoryManager {
	private var categories = [Category]()
	
	func getProductWithId(_ id: Int) -> Product? {
		var foundedProduct: Product!
		
		for category in categories {
			for product in category.productsInCategory {
				if product.id == id {
					foundedProduct = product
				}
			}
		}
		return foundedProduct
	}
	
	func getProductsInCategory(_ categoryName: String) -> [Product] {
		var products: [Product] = []

		for category in categories {
			if categoryName == category.categoryTitle {
				for product in category.productsInCategory {
					
					products.append(product)
				}
			}
		}
		return products
	}
	
	func addCategories(_ categories: [Category]) {
		self.categories.append(contentsOf: categories)
	}
	
	func getAllCategories() -> [Category] {
		categories
	}
}
