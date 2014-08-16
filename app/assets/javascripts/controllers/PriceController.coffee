angular.module('btcdash')

.controller("PriceController", [ '$scope', '$http', '$resource', 'PriceFactory', '$interval',
  ($scope,$http,$resource,PriceFactory,$interval) ->
    priceGrab = ->
      $(".changeme").addClass("fa").addClass("fa-spin").addClass("fa-circle-o-notch") 
      $http.get('/latest_price.json').success((data) ->
        $(".changeme").removeClass("fa").removeClass("fa-spin").removeClass("fa-circle-o-notch") 
        $scope.price = data
    )
    setInterval(priceGrab, 15000)
    priceGrab()
])