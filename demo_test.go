package demo_test

import (
	"demo"
	"testing"
)

func TestHello(t *testing.T) {
	if demo.Hello() != "Hello" {
		t.Error("Fail")
	}
}