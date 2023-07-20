package main

import . "fmt"

const (
	m = 21
	n = 21
)

func checkbounds(i, j int) bool {
	if i >= 0 && j >= 0 && i < m && j < n {
		return true
	}
	return false
}

var g = []int{m - 1, n - 1}
var ans int

func solve(i, j int) {
	if !checkbounds(i, j) {
		return
	}
	if i == g[0] && j == g[1] {
		ans++
	}
	solve(i+1, j) // down
	solve(i, j+1) // right
}

func main() {
	solve(0, 0)
	Println(ans)
}
