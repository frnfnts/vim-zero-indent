" test1
let v:errors = []
let text = ["asdf\n", " aa\n"]
let actuall = zero_indent#CountMinimumIndent(text)
let expected = 0
call assert_equal(expected, actuall)
echo v:errors

" test2
let v:errors = []
let text = [" asdf\n", " aa\n", "  aa\n", "  a\n", " a\n"]
let actuall = zero_indent#CountMinimumIndent(text)
let expected = 1
call assert_equal(expected, actuall)
echo v:errors

" test3
let v:errors = []
let text = [" asdf\n", " aa\n", "  aa\n", "  a\n", " a\n"]
let actuall = zero_indent#RemoveIndent(text)
let expected = ["asdf\n", "aa\n", " aa\n", " a\n", "a\n"]
call assert_equal(expected, actuall)
echo v:errors
