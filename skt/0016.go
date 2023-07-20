// big int problem
package main

import (
	"fmt"
	"math"
)

func intSum(n int64) int {
	var sum int64
	for n > 0 {
		sum += n % 10
		n /= 10
	}
	return int(sum)
}

func main() {
}
