# Result<T, E> for odin lang

### Why
>> To avoid the nil check by any means necessary

>> For fun 


## Example
```odin
import rs "result"

safe_div :: proc(x: i32, y: i32) -> rs.Result(i32, string) {
	if y == 0 do return rs.Err(string){"Divide by zero"}
	return rs.Ok(i32){x / y}
}
```



