editorModule "Basic input", template: "basic_editor_empty"

testEditorManipulation "typing", (expectDocument) ->
  typeCharacters "foo", ->
    expectDocument "foo\n"

testEditorManipulation "backspacing", (expectDocument) ->
  typeCharacters "abc\b", ->
    expectDocument "ab\n"

testEditorManipulation "pressing return", (expectDocument) ->
  typeCharacters "ab\rc", ->
    expectDocument "ab\nc\n"

testEditorManipulation "cursor left", (expectDocument) ->
  typeCharacters "ac", ->
    moveCursor "left", ->
      typeCharacters "b", ->
        expectDocument "abc\n"

testEditorManipulation "replace entire document", (expectDocument) ->
  typeCharacters "abc", ->
    selectAll ->
      typeCharacters "d", ->
        expectDocument "d\n"

testEditorManipulation "remove entire document", (expectDocument) ->
  typeCharacters "abc", ->
    selectAll ->
      typeCharacters "\b", ->
        expectDocument "\n"

testEditorManipulation "paste plain text", (expectDocument) ->
  typeCharacters "abc", ->
    moveCursor "left", ->
      pasteContent "text/plain", "!", ->
        expectDocument "ab!c\n"

testEditorManipulation "paste html", (expectDocument) ->
  typeCharacters "abc", ->
    moveCursor "left", ->
      pasteContent "text/html", "&lt;", ->
        expectDocument "ab<c\n"

testEditorManipulation "paste file", (expectDocument) ->
  pasteContent "Files", (getAsFile: -> {}), ->
    expectDocument "#{Trix.AttachmentPiece.OBJECT_REPLACEMENT_CHARACTER}\n"
