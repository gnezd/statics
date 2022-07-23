#mappings = (0x0390 .. 0x03cf).map {|code| ["%04x" % code, "%c" % code]}
#puts mappings

html_out = File.open 'greek_letters.html', 'w'

html_head = <<HTMLHEAD
<!DOCTYPE html>
<html>
<head>
<title>Greek letters</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
HTMLHEAD

html_tail = <<HTMLTAIL
</body>
</html>
HTMLTAIL

html_out.puts html_head
html_out.puts "<table>"

start_row = 0x390

(0..3).each do |row_num|
  row = start_row + 16* row_num
  line_unicode = "<tr class=\"unicode\" id=\"row#{row_num}-unicode\">" + ((0..15).map {|i| "<td id=\"x#{row_num}y#{i}\"> %04x </td>" % (i + row)}).join("\n") + "</tr>"
  line_letter = "<tr class=\"letter\" id=\"row#{row_num}-letter\">" + ((0..15).map {|i| "<td id=\"x#{row_num}y#{i}\"> %c </td>" % (i + row)}).join("\n") + "</tr>"
  html_out.puts line_unicode
  html_out.puts line_letter
end

html_out.puts "</table>"

html_out.puts html_tail