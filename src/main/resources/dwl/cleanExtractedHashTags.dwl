%dw 2.0
output application/json
var items = flatten(payload.hashtags) filter (value, index) -> (value != null)
---
{
	hashtags: items distinctBy (value) -> { "unique" : value }
}