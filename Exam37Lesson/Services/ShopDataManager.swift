//
//  ShopDataManager.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 12.12.2024.
//

import Foundation

protocol IShopDataManager {
	func getCategories() -> [Category]
}

class ShopDataManager {}

extension ShopDataManager: IShopDataManager {
	func getCategories() -> [Category] {
		[
			Category(
				categoryTitle: "Grains and Bread",
				productsInCategory: [
					Product(
						id: 1,
						title: "Bread",
						description: "Freshly baked bread with a golden crust and soft texture.",
						price: 140,
						imageName: "Bread"
					),
					Product(
						id: 7,
						title: "Rice",
						description: "Quick-cooking rice, the ideal side dish for various meals.",
						price: 90,
						imageName: "Rice"
					),
					Product(
						id: 8,
						title: "Pasta",
						description: "Classic pasta, versatile and easy to cook for a variety of recipes.",
						price: 120,
						imageName: "Pasta"
					)
				]
			),
			Category(
				categoryTitle: "Meat and Poultry",
				productsInCategory: [
					Product(
						id: 2,
						title: "Eggs",
						description: "Organic eggs, a great source of high-quality protein and healthy fats.",
						price: 180,
						imageName: "Eggs"
					),
					Product(
						id: 5,
						title: "Chicken",
						description: "Skinless chicken fillet, rich in protein and easy to digest.",
						price: 250,
						imageName: "Chicken"
					),
					Product(
						id: 6,
						title: "Beef",
						description: "High-quality beef, perfect for preparing delicious dishes.",
						price: 350,
						imageName: "Beef"
					)
				]
			),
			Category(
				categoryTitle: "Dairy Products",
				productsInCategory: [
					Product(
						id: 0,
						title: "Milk",
						description: "Fresh and nutritious dairy product, rich in calcium and vitamin D.",
						price: 110,
						imageName: "Milk"
					),
					Product(
						id: 3,
						title: "Cheese",
						description: "Natural cheese with a rich flavor, an excellent source of calcium.",
						price: 290,
						imageName: "Cheese"
					),
					Product(
						id: 4,
						title: "Butter",
						description: "Butter made from natural cream, perfect for baking and cooking.",
						price: 320,
						imageName: "Butter"
					)
				]
			),
			Category(
				categoryTitle: "Vegetables",
				productsInCategory: [
					Product(
						id: 9,
						title: "Tomatoes",
						description: "Fresh, juicy tomatoes, rich in vitamins and antioxidants.",
						price: 75,
						imageName: "Tomatoes"
					)
				]
			)
		]
	}
}
