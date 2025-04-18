//
//  DetectorEvaluationView.swift
//  Sidekick
//
//  Created by John Bean on 2/24/25.
//

import SwiftfulLoadingIndicators
import SwiftUI

struct DetectorEvaluationView: View {
	
	let stallingPhrases: [String] = [
		String(localized: "Just a moment..."),
		String(localized: "Evaluating your content..."),
		String(localized: "Identifying patterns...")
	]
	
	@State private var timer: Timer? = nil
	
	@State private var stallingPhraseIndex: Int = 0
	
	/// The current stalling phrase, of type `String`
	var stallingPhraseStr: String {
		return self.stallingPhrases[stallingPhraseIndex]
	}
	
	var body: some View {
		VStack(
			spacing: 35
		) {
			LoadingIndicator(
				animation: .doubleHelix,
				size: .large
			)
			stallingPhrase
		}
	}
	
	var stallingPhrase: some View {
		Text(stallingPhraseStr)
			.font(.title)
			.bold()
			.contentTransition(.numericText())
			.onAppear {
				self.setupTimer()
			}
			.onDisappear {
				self.timer?.invalidate()
				self.timer = nil
			}
	}
	
	/// Function to setup the stalling phrase timer
	private func setupTimer() {
		self.timer = Timer.scheduledTimer(
			withTimeInterval: 10,
			repeats: true
		) { _ in
			withAnimation(.linear) {
				self.stallingPhraseIndex = (self.stallingPhraseIndex + 1) % self.stallingPhrases.count
			}
		}
	}
	
}
