angular.module('btcdash')

.controller("PriceController", [ '$scope','$location', '$http', '$routeParams', '$resource', 'PriceFactory',
  ($scope,$location,$http,$routeParams,$resource,PriceFactory) ->
    $http.get('/latest_price.json').success((data) ->
      $scope.price = data
    ) 
])