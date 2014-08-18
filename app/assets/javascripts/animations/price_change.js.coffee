angular.module('btcdash')

.animation('.price-change', ->
  addClass: (el, className, done) ->
    $(el).hide().fadeIn(300)

  removeClass: (el, className, done) ->
    if className == 'ng-hide'
      $(el).hide().fadeIn()
)