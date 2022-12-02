import Foundation

public func solvePuzzle1() -> Int {
	let mainBundle: Bundle = .main
	guard let url = mainBundle.url(forResource: "Puzzle 1 Input", withExtension: "txt") else {
		fatalError("Failed to find input file.")
	}
	
	let max = try? readInput(at: url)
		.map() { $0.reduce(0, +) }
		.max()
	
	guard let max = max else {
		fatalError("Failed to read input file.")
	}
	
	return max
}

private func readInput(at url: URL) throws -> [[Int]] {
	let contents = try String(contentsOf: url, encoding: .utf8)
	
	var values: [[Int]] = []
	var current: [Int] = []
	
	contents.components(separatedBy: .newlines)
		.enumerated()
		.forEach() {
			if $1.isEmpty {
				values.append(current)
				current = []
			} else if let calory = Int($1) {
				current.append(calory)
			} else {
				fatalError("Unexpected value \"\($1)\" at line \($0).")
			}
		}
	
	return values
}
