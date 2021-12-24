//
//  GramophoneViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Андрей Щекатунов on 24.12.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol GramophoneViewModelInput {
	func play()
	func pause()
	func stop()
}

protocol GramophoneViewModelOutput {
	var onProgressViewChanged: ((Double) -> Void)? { get set }
}

class GramophoneViewModel: GramophoneViewModelOutput  {

	var onProgressViewChanged: ((Double) -> Void)?

	var timer: Timer?
	var progress: Double {
		didSet {
			onProgressViewChanged?(progress)
		}
	}

	init(progress: Double, onProgressViewChanged: ((Double) -> Void)?) {
		self.progress = progress
		self.onProgressViewChanged = onProgressViewChanged
		onProgressViewChanged?(progress)
	}

}

extension GramophoneViewModel: GramophoneViewModelInput {

	func play() {
		print("play")
		timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] (timer) in
			guard let self = self else { return }

			let newProgress = self.progress + 0.05
			if self.progress == 1 {
				timer.invalidate()
			}
			self.progress = min(newProgress, 1)
		}
	}

	func pause() {
		print("pause")
		timer?.invalidate()
	}

	func stop() {
		print("stop")
		timer?.invalidate()
		progress = 0
	}
}
