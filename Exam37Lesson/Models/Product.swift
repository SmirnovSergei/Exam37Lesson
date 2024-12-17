//
//  Product.swift
//  Exam37Lesson
//
//  Created by Сергей Смирнов on 08.12.2024.
//

import UIKit

struct Product {
	let id: Int
	let title: String
	let description: String
	let price: Double
	let imageName: String
}

extension Product: Equatable {}
