package Result

import "core:fmt"

Ok :: struct($T: typeid) {
	value: T,
}

Err :: struct($E: typeid) {
	error: E,
}

Result :: union($T: typeid, $E: typeid) {
	Ok(T),
	Err(E),
}

is_ok :: proc(rs: Result($T, $E)) -> bool {
	#partial switch type in rs {
	case Ok(T):
		return true
	}
	return false
}

is_err :: proc(rs: Result($T, $E)) -> bool {
	return !is_ok(rs)
}

unwrap :: proc(rs: Result($T, $E)) -> T {
	result: T // Weird stuff?
	switch v in rs {
	case Err(E):
		err := rs.(Err(E))
		fmt.panicf("Attempt to unrap Result.Err with message: `%s`", err.error)
	case Ok(T):
		ok := rs.(Ok(T))
		// result := ok.value -> result is always 0 for some reason
		return ok.value
	}
	return result
}


unwrap_err :: proc(rs: Result($T, $E)) -> E {
	err: string
	switch v in rs {
	case Err(E):
		err := rs.(Err(E))
		return err.error
	case Ok(T):
		fmt.panicf("Attempt to unrap Result.Ok")
	}
	return err
}
