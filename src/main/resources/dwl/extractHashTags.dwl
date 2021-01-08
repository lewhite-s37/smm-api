%dw 2.0
output application/java
---
{
 	hashtags: (
 		payload.statuses.*entities.hashtags map ($.text)
	)
}