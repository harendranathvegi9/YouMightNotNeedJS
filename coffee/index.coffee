showFirst = (els...) ->
  found = false

  for el in els
    if el and not found
      found = true
      el.style.display = 'block'
    else if el
      el.style.display = 'none'

hide = (els...) ->
  for el in els when el
    el.style.display = 'none'

filter = (term) ->
  visibleIndex = 0

  allEmpty = true

  for section in document.querySelectorAll('section')
    empty = true

    for comp in section.querySelectorAll('.comparison')
      if not term or comp.textContent.toLowerCase().indexOf(term.toLowerCase()) isnt -1
        empty = false
        comp.classList.remove 'hidden'
      else
        comp.classList.add 'hidden'

    if empty
      section.classList.add 'hidden'
    else
      allEmpty = false

      section.classList.remove 'hidden'

      if ++visibleIndex % 2
        section.classList.add 'odd'
      else
        section.classList.remove 'odd'

  comparisons = document.querySelector('.comparisons')
  if allEmpty
    comparisons.classList.add 'empty'
  else
    comparisons.classList.remove 'empty'