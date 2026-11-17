; TEMPORARY VERSION - without declare_block references
; Use this until you install the updated parser

; All blocks get consistent highlighting regardless of location
(block
  name: (qualified_identifier) @keyword)

; Regular block labels
(block
  label: (label) @string)

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

; Highlight the key of an attribute
(attribute
  key: (identifier) @property)

; For references like `discovery.relabel.output`
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

; Highlight identifiers when used as values
(attribute
  value: (qualified_identifier) @keyword)

(array
  (qualified_identifier) @keyword)

;======================================================================
; Punctuation and Operators
;======================================================================

[
  "[" "]"
  "{" "}"
  "(" ")"
] @punctuation.bracket

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

(interpolation
  "${" @punctuation.special
  "}" @punctuation.special) @embedded

(interpolation
  (_expression) @variable)

(interpolation
  (qualified_identifier (identifier) @punctuation.special))

(interpolation
  (_expression) @variable)