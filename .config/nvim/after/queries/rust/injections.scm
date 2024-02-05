; extends

(macro_invocation
  macro: (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#match? @_name "^query(_as)?$"))

  (token_tree
    (string_literal) @injection.content
      (#set! injection.language "sql")
      (#offset! @injection.content 0 1 0 -1)))

(macro_invocation
  macro: (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#match? @_name "^query(_as)?$"))

  (token_tree
    (raw_string_literal) @injection.content
      (#set! injection.language "sql")
      (#offset! @injection.content 0 3 0 -2)))

(call_expression
  function: (scoped_identifier
    path: (identifier) @_path (#eq? @_path "QueryBuilder")
    name: (identifier) @_name (#match? @_name "new"))

  arguments: (arguments
    (string_literal) @injection.content
      (#set! injection.language "sql")
      (#offset! @injection.content 0 1 0 -1)))

(call_expression
  function: (scoped_identifier
    path: (identifier) @_path (#eq? @_path "QueryBuilder")
    name: (identifier) @_name (#match? @_name "new"))

  arguments: (arguments
    (raw_string_literal) @injection.content
      (#set! injection.language "sql")
      (#offset! @injection.content 0 3 0 -2)))
