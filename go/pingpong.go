
// Package main implements a simple terminal-based ping pong game.
// The game consists of a ball that bounces around within a defined
// rectangular area. The ball changes direction when it hits the
// boundaries of the rectangle.
//
// The game runs in an infinite loop, updating the ball's position
// and redrawing the screen at regular intervals.
//
// How to play:
// - Run the program in a terminal.
// - Watch the ball bounce around the screen.
// - The ball will automatically change direction when it hits the
//   edges of the defined area.
//
// Note: This is a simple demonstration and does not require any
// user interaction.
package main

import (
	"fmt"
	"time"
)

const (
	width  = 40
	height = 10
)

type Ball struct {
	x, y  int
	dx, dy int
}

func (b *Ball) move() {
	b.x += b.dx
	b.y += b.dy

	if b.x <= 0 || b.x >= width {
		b.dx = -b.dx
	}
	if b.y <= 0 || b.y >= height {
		b.dy = -b.dy
	}
}

func draw(ball Ball) {
	for y := 0; y < height; y++ {
		for x := 0; x < width; x++ {
			if x == ball.x && y == ball.y {
				fmt.Print("O")
			} else {
				fmt.Print(" ")
			}
		}
		fmt.Println()
	}
}

func main() {
	ball := Ball{x: width / 2, y: height / 2, dx: 1, dy: 1}

	for {
		draw(ball)
		ball.move()
		time.Sleep(100 * time.Millisecond)
		fmt.Print("\033[H\033[2J")
	}
}

