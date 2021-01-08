%dw 2.0
output application/java
var timeExp = ("PT" ++ attributes.queryParams.'hours' ++ "H") as String
var currentTime = now()
fun stampIt(d: DateTime) = d as Number {unit: "milliseconds"}
---
	stampIt(currentTime - (timeExp as Period) >> 'UTC')
