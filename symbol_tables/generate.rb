#mappings = (0x0390 .. 0x03cf).map {|code| ["%04x" % code, "%c" % code]}
#puts mappings

html_out = File.open 'greek_letters_and_some_other_symbols.html', 'w'

html_head = <<HTMLHEAD
<!DOCTYPE html>
<html>
<head>
<title>Greek letters and some other symbols</title>
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

# Greek
start_row = 0x390
(0..3).each do |row_num|
  row = start_row + 16* row_num
  line_unicode = "<tr class=\"unicode greek\" id=\"row#{row_num}-unicode\">" + ((0..15).map {|i| "<td id=\"x#{row_num}y#{i}\"> %04x </td>" % (i + row)}).join("\n") + "</tr>"
  line_letter = "<tr class=\"letter greek\" id=\"row#{row_num}-letter\">" + ((0..15).map {|i| "<td id=\"x#{row_num}y#{i}\"> %c </td>" % (i + row)}).join("\n") + "</tr>"
  html_out.puts line_unicode
  html_out.puts line_letter
end

# Math
html_out.puts "<tr><td></td></tr>"
start_row = 0x2200
(0..8).each do |row_num| #This is a bit much but let's see later
  row = start_row + 16* row_num
  line_unicode = "<tr class=\"unicode math\" id=\"row#{row_num}-unicode\">" + ((0..15).map {|i| "<td id=\"x#{row_num}y#{i}\"> %04x </td>" % (i + row)}).join("\n") + "</tr>"
  line_letter = "<tr class=\"letter math\" id=\"row#{row_num}-letter\">" + ((0..15).map {|i| "<td id=\"x#{row_num}y#{i}\"> %c </td>" % (i + row)}).join("\n") + "</tr>"
  html_out.puts line_unicode
  html_out.puts line_letter
end


some_others = [0x00b0, 0x2026, 0xd8]
html_out.puts "<tr><td></td></tr>"
html_out.puts "<tr class=\"unicode\" id=\"row-1-unicode\">" + ((0..some_others.size-1).map {|i| "<td id=\"x-1y#{i}\"> %04x </td>" % (some_others[i])}).join("\n") + "</tr>"
html_out.puts "<tr class=\"letter\" id=\"row-1-letter\">" + ((0..some_others.size-1).map {|i| "<td id=\"x-1y#{i}\"> %c </td>" % (some_others[i])}).join("\n") + "</tr>"


html_out.puts "</table>"

html_out.puts html_tail