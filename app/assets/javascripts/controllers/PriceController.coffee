angular.module('btcdash')

.controller("PriceController", [ '$scope', '$http', '$resource', 'PriceFactory', '$interval',
  ($scope,$http,$resource,PriceFactory,$interval) ->
    priceGrab = -> 
      $http.get('/latest_price.json').success((data) ->
        $scope.price = data
    )
    setInterval(priceGrab, 15000)
    priceGrab()
])