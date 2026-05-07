local function rewrite_target(target)
  if target:match("^https?://") then
    return target
  end
  if target:match("^#") then
    return target
  end
  if target:match("%.md$") then
    return target:gsub("%.md$", ".html")
  end
  return target
end

function Link(el)
  el.target = rewrite_target(el.target)
  return el
end
