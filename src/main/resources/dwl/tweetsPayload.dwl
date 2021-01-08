%dw 2.0
output application/json
fun stampIt(d: DateTime) = d as Number {unit: "milliseconds"}
---
 {
 	tweets: (
 		payload.statuses map {
			(text: $.text as String) if stampIt($.created_at as DateTime {format: "E MMM dd HH:mm:ss Z yyyy"}) > vars.maxSearchTime,
			(screenName: $.user.screen_name as String) if stampIt($.created_at as DateTime {format: "E MMM dd HH:mm:ss Z yyyy"}) > vars.maxSearchTime,
			(url: "http://twitter.com/user/status/" ++ $.id_str) if stampIt($.created_at as DateTime {format: "E MMM dd HH:mm:ss Z yyyy"}) > vars.maxSearchTime
		}
	)
}