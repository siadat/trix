Trix.config.blockAttributes = attributes =
  default:
    tagName: "div"
    parse: false
  ltr:
    tagName: "div"
    parse: false
    htmlAttributes:
       dir: "ltr"
       style: "text-align:left;"
  rtl:
    tagName: "div"
    parse: false
    htmlAttributes:
       dir: "rtl"
       style: "text-align:right;"
  quote:
    tagName: "blockquote"
    nestable: true
  code:
    tagName: "pre"
    text:
      plaintext: true
  bulletList:
    tagName: "ul"
    parse: false
  bullet:
    tagName: "li"
    listAttribute: "bulletList"
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName
  numberList:
    tagName: "ol"
    parse: false
  number:
    tagName: "li"
    listAttribute: "numberList"
    test: (element) ->
      Trix.tagName(element.parentNode) is attributes[@listAttribute].tagName
