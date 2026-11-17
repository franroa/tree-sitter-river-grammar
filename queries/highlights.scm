; 🌌 GALAXY THEME APPLIED 🌌
; Declare blocks get stardust pale blue cursive highlighting
(declare_block
  keyword: "declare" @keyword.directive) 

(declare_block
  label: (label) @string)

; Single word blocks get nebula purple highlighting
(block
  name: (qualified_identifier
    (identifier)) @keyword)

; Top-level multi-word blocks get nebula purple color
(config_file
  (block
    name: (qualified_identifier 
      (identifier)
      "."
      (identifier)) @keyword))

; Top-level blocks in declare_block get nebula purple color
(declare_block
  (block_body
    (block
      name: (qualified_identifier 
        (identifier)
        "."
        (identifier)) @keyword)))
;======================================================================
; Base Tokens
;======================================================================

(comment) @comment
(numeric_lit) @number
(bool_lit) @boolean
(null_lit) @constant.builtin

;======================================================================
; String Literals and Their Contents
;======================================================================

(string_lit) @string
; (_string_content) @string ; Captures the plain text inside a string
(escape_sequence) @string.escape

;======================================================================
; Keywords, Types, and Functions
;======================================================================

; Highlight function names
(function_call
  function: (qualified_identifier) @function)

;======================================================================
; Attributes, Variables, and Identifiers
;======================================================================

; Highlight the key of an attribute, e.g., the "job_name" in job_name = "..."
(attribute
  key: (identifier) @property)

; For a reference like `discovery.relabel.output`, this highlights
; the first part as a namespace/variable and subsequent parts as properties.
(attribute
  (qualified_identifier
    (identifier) @namespace
    "."
    (identifier) @property))
(array
  (qualified_identifier
    (identifier) @namespace
    "."
    (identifier) @property))

; Highlight member access variables
; Base case: qualified_identifier.property
(member_access
  object: (qualified_identifier) @keyword
  property: (identifier) @property)

; Nested case: when object is also a member_access, highlight its property part
(member_access
  object: (member_access
    property: (identifier) @property)
  property: (identifier) @property)

; Regular qualified identifiers used as values get keyword color
(qualified_identifier) @keyword

; Single identifiers used as values get keyword color
(attribute
  value: (qualified_identifier
    (identifier)) @keyword)

(array
  (qualified_identifier
    (identifier)) @keyword)

; Highlight the special label string for a block
(block
  label: (label) @string)

;======================================================================
; Punctuation and Operators
;======================================================================

[
  "[" "]"
  "{" "}"
  "(" ")"
] @punctuation.bracket

[
  "[" "]"
  "{" "}"
  "(" ")"
] @punctuation

[
  "."
  ","
] @punctuation.delimiter

[
  "-" "!" "!="
  "*" "/" "%" "^"
  "+" "<" "<="
  "=" "==" ">" ">="
  "||" "&&"
] @operator


;======================================================================
; String Interpolation
;======================================================================

; Highlight the interpolation markers `${` and `}`
(interpolation
  "${" @punctuation.special
  "}" @punctuation.special) @embedded

; Highlight the expression inside an interpolation block as a variable
(interpolation
  (_expression) @variable)

; Highlight the qualified_identifier inside an interpolation as a type.
; This is the specific rule you requested.
(interpolation
  (qualified_identifier (identifier) @punctuation.special))

; Fallback for any other expression inside an interpolation, highlighting it as a variable.
(interpolation
  (_expression) @variable)

; Nested single-word blocks get solar flare orange color (Galaxy Theme)
(block
  body: (block_body
    (block
      name: (qualified_identifier
        (identifier)) @number)))

; Nested multi-word blocks get cosmic blue color - GALAXY THEME (MUST BE LAST to override other rules)
(block
  body: (block_body
    (block
      name: (qualified_identifier
        (identifier)
        "."
        (identifier)) @type)))
