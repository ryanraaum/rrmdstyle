function BlockQuote(el)
  new_el = {pandoc.RawBlock("latex", "\\begin{rrblockquote}\\begin{large}")}
  for k,v in pairs(el.content) do
    table.insert(new_el, v)
  end
  table.insert(new_el, pandoc.RawBlock("latex", "\\end{large}\\end{rrblockquote}"))
  return new_el
end