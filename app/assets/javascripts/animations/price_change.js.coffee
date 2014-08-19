angular.module('btcdash')

.animation('.price-change', ->
  addClass: (element) ->
    element.css('opacity',0)
    jQuery(element).animate(
      opacity: 1
      )
)