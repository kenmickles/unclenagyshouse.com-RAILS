#= require jquery
#= require jquery_ujs
#= require_self
#= require_tree .

window.App =
  init: (controller, method) ->
    # initialize controller-specific events
    App[controller][method]() if typeof App[controller]?[method] == 'function'