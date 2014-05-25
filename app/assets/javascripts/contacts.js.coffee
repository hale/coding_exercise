# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

selected_field = ()->
  return $('input:focus').attr('id')

@engine = new Bloodhound(
  name: 'contact_match'
  local: []
  remote:
    url: "/contacts/autocomplete?query=%QUERY&on=%ON"
    replace: (url, query) ->
      scope = encodeURIComponent(selected_field())
      return url.replace('%QUERY', query).replace('%ON', scope)
  datumTokenizer: (d) ->
    Bloodhound.tokenizers.whitespace(d.val)
  queryTokenizer: Bloodhound.tokenizers.whitespace
)

@engine.initialize()

$('input.contact_match').typeahead(null,
  displayKey: 'full_name',
  source: @engine.ttAdapter()
).bind "typeahead:selected", (obj, datum, name) ->
  window.history.pushState({ id: datum.id }, '', ("/contacts/" + datum.id))
  window.location.reload()
  return

