public extension Sequence where Element == Int {
	func sum() -> Int {
		return self.reduce(0, +)
	}
}

public extension Array where Element: Comparable {
	func top(_ count: Int) -> SubSequence? {
		guard count <= self.count else {
			return nil
		}
		
		return self.sorted(by: >)
			.prefix(count)
	}
}
