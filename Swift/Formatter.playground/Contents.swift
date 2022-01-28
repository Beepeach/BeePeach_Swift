import UIKit

// "Z"는 시간대를 의미 UTC라면 Z 나머지 시간대는 +09:00과 같이 표시한다.
var dateStr = "1970-01-01T00:00:00" + "Z"
let iso8601Formatter = ISO8601DateFormatter()
//iso8601Formatter.formatOptions = [.withFullTime, .withFullDate, .withDashSeparatorInDate, .withColonSeparatorInTime]

var date = iso8601Formatter.date(from: dateStr)
print(date)


dateStr = "1970-01-01T00:00:00"
// withTime으로 하면 nil이 안되고 잘 출력이 된다.

// withFullTime으로 하면 "Z"를 추가해야한다.
// 그 이유는?!?!
iso8601Formatter.formatOptions = [.withTime, .withFullDate, .withDashSeparatorInDate, .withColonSeparatorInTime]

date = iso8601Formatter.date(from: dateStr)
print(date)
