package main

import "core:fmt"
import rs "result"

safe_div :: proc(x: i32, y: i32) -> rs.Result(i32, string) {
	if y == 0 do return rs.Err(string){"Divide by zero"}
	return rs.Ok(i32){x / y}
}

main :: proc() {
	x :: 100
	y :: 0
	answer := safe_div(x, y)
	if rs.is_err(answer) do fmt.println("Error:", rs.unwrap_err(answer))
	else do fmt.println(rs.unwrap(answer))
}
