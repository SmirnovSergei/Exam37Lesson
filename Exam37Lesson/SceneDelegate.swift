//
//  SceneDelegate.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 08.12.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(windowScene: windowScene)
		
		let viewController = TableViewController()
		viewController.categoryManager = buildCategoryManager()
		
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
	}
}

extension SceneDelegate {
	func buildCategoryManager() -> ICategoryManager {
		let shopDataManager: IShopDataManager = ShopDataManager()
		let categoryManager = CategoryManager()
		categoryManager.addCategories(shopDataManager.getCategories())
		
		return categoryManager
	}
}
