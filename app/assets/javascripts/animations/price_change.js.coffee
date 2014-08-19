angular.module('btcdash')

.animation('.price-change', ->
  addClass: (element, done) -> 
    element.hide().fadeIn(300)
    done
  removeClass: (element, className) ->
    if className
      element.removeClass(className)
)