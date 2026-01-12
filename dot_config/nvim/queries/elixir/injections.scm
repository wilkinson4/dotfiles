((call
   target: (identifier) @target
   (#eq? @target "fragment")
 (arguments
    . (string (quoted_content) @injection.content)
   )
 )
 (#set! injection.language "sql"))


((call
   target: (identifier) @target
   (#eq? @target "execute")
 (arguments
     (string (quoted_content) @injection.content)
   )
 )
 (#set! injection.language "sql"))
