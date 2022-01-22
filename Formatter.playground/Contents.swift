import UIKit

let dateStr = "1970-01-01T00:00:00" + "Z"
print(dateStr)
let iso8601Formatter = ISO8601DateFormatter()
//iso8601Formatter.formatOptions = [.withFullTime, .withFullDate, .withDashSeparatorInDate, .withColonSeparatorInTime]

iso8601Formatter.date(from: dateStr)
