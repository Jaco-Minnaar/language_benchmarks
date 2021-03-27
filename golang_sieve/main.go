package main

import (
	"fmt"
	"math"
	"time"
)

func main() {
	start := time.Now()
	iterations := 0

	for time.Since(start).Milliseconds() < 5000 {
		findPrimes(1000000)
		iterations++
	}

	fmt.Printf("Golang performed %d iterations in 5 seconds\n", iterations)
}

func findPrimes(max uint64) {
	var bv = make([]bool, max/2+1)

	for i := range bv {
		bv[i] = true
	}

	bv[0] = false

	for i := uint64(3); i < 1+uint64(math.Sqrt(float64(max))); i += 2 {
		if bv[i/2] {
			for j := i; i*j < max; j += 2 {
				bv[(i*j)/2] = false
			}
		}
	}

	var numPrimes = 0
	for i := range bv {
		if bv[i] {
			numPrimes++
		}
	}

	if numPrimes != 78498 {
		fmt.Printf("%d != 78498\n", numPrimes)
	}
}
