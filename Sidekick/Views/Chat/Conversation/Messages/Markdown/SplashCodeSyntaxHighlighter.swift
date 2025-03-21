//
//  SplashCodeSyntaxHighlighter.swift
//  Sidekick
//
//  Created by Bean John on 10/8/24.
//

import MarkdownUI
import Splash
import SwiftUI

struct SplashCodeSyntaxHighlighter: CodeSyntaxHighlighter {
	
	private let syntaxHighlighter: SyntaxHighlighter<TextOutputFormat>
	
	init(theme: Splash.Theme) {
		self.syntaxHighlighter = SyntaxHighlighter(format: TextOutputFormat(theme: theme))
	}
	
	func highlightCode(_ content: String, language: String?) -> Text {
		return self.syntaxHighlighter.highlight(content)
	}
	
}

extension CodeSyntaxHighlighter where Self == SplashCodeSyntaxHighlighter {
	
	static func splash(theme: Splash.Theme) -> Self {
		SplashCodeSyntaxHighlighter(theme: theme)
	}
	
}
