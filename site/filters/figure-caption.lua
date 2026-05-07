function Para(el)
  if #el.content ~= 1 then
    return nil
  end

  local img = el.content[1]
  if img.t ~= "Image" then
    return nil
  end

  if #img.caption == 0 then
    return nil
  end

  local fig = pandoc.Div(
    {
      pandoc.Para({ pandoc.Image(img.caption, img.src, img.title, img.attr) }),
      pandoc.Para(img.caption)
    },
    pandoc.Attr("", { "figure" })
  )
  return fig
end
