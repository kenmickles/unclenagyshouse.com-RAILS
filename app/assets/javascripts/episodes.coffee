App.Episodes ?= {}

App.Episodes.Show = ->
  # resize video to fit page
  resize_video = ->
    $video = $('#video')
    h = (516/900) * $video.width()
    $video.height(h)

  $(window).resize(resize_video)
  resize_video()

  # if #credits is in the hash, show them on load
  $('#credits').show() if location.hash == '#credits'

  # toggle credits when button is clicked
  $('a.btn-credits').click (e) ->
    e.preventDefault()

    $div = $('#credits')

    $div.slideToggle 'fast', ->
      if $div.is(':visible')
        $('html,body').animate({scrollTop: $div.offset().top}, 'slow', -> location.hash = '#credits')
      else
        location.hash = '#none'