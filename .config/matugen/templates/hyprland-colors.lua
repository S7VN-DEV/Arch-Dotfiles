local C = {}
C.wallpaper = "{{image}}"

<* for name, value in colors *>
C.{{name}} = 0xee{{value.default.hex_stripped}}
<* endfor *>

return C
