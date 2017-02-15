$ ->
  $('.pin-grid').imagesLoaded ->
    $('.pin-grid').masonry
      itemSelector: '.pin-item'
      isFitWidth: true
