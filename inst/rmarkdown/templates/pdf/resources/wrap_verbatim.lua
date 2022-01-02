function CodeBlock(el)
  if el.attr.classes[1] == "bg-danger" then
    new_el = {pandoc.RawBlock("latex", "\\begin{rrerrorbox}"),
      el,
      pandoc.RawBlock("latex", "\\end{rrerrorbox}")
    }
    return new_el
  elseif el.attr.classes[1] == "bg-success" then
    new_el = {pandoc.RawBlock("latex", "\\begin{rrsuccessbox}"),
      el,
      pandoc.RawBlock("latex", "\\end{rrsuccessbox}")
    }
    return new_el
  elseif el.attr.classes[1] == "bg-info" then
    new_el = {pandoc.RawBlock("latex", "\\begin{rrinfobox}"),
      el,
      pandoc.RawBlock("latex", "\\end{rrinfobox}")
    }
    return new_el
  elseif el.attr.classes[1] == "bg-warning" then
    new_el = {pandoc.RawBlock("latex", "\\begin{rrwarningbox}"),
      el,
      pandoc.RawBlock("latex", "\\end{rrwarningbox}")
    }
    return new_el
  else -- for "r" blocks and all others
    new_el = {pandoc.RawBlock("latex", "\\begin{rrcodebox}"),
      el,
      pandoc.RawBlock("latex", "\\end{rrcodebox}")
    }
    return new_el
  end
  return el
end