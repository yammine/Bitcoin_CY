angular.module('btcdash')

.controller("PriceController", [ '$scope', '$http', '$interval'
  ($scope, $http, $interval) ->

    priceGrab = ->
      $(".changeme").addClass("fa").addClass("fa-spin").addClass("fa-circle-o-notch") 
      $http.get('/latest_price.json').success((data) ->
        $(".changeme").removeClass("fa").removeClass("fa-spin").removeClass("fa-circle-o-notch") 
        $scope.cad = data["CAD"]
        $scope.cny = data["CNY"]
        $scope.time = data["time"]
        $scope.prevCad = data["prevCAD"]
        $scope.prevCny = data["prevCNY"]

        # Calculating difference
        $scope.cadChange = ($scope.cad - $scope.prevCad).toFixed(2)
        $scope.cnyChange = ($scope.cny - $scope.prevCny).toFixed(2)
    )
    $interval(priceGrab, 15000)
    priceGrab()

    $scope.$watchCollection('[cad,cny,time,prevCad,prevCny]', ->
        # Watching the CAD price 
        if $scope.cad > $scope.prevCad
          $("#cad").hide().css('color', 'green')
          $("#cad").fadeIn(300)
          $("#cad-change").addClass("fa-toggle-up").css('color', 'green')
          $("#cad-change").removeClass("fa-toggle-down")
        else if $scope.prevCad > $scope.cad
          $("#cad").hide().css('color', 'red')
          $("#cad").fadeIn(300)
          $("#cad-change").addClass("fa-toggle-down").css('color', 'red')
          $("#cad-change").removeClass("fa-toggle-up")
        else
          $("#cad").hide().css('color', 'black')
          $("#cad").fadeIn(300)
          $("#cad-change").removeClass("fa-toggle-up").removeClass('fa-toggle-down')

        # Watching the CNY price
        if $scope.cny > $scope.prevCny
          $("#cny").hide().css('color', 'green')
          $("#cny").fadeIn(300)
          $("#cny-change").addClass("fa-toggle-up").css('color', 'green')
          $("#cny-change").removeClass("fa-toggle-down")
        else if $scope.prevCny > $scope.cny
          $("#cny").hide().css('color', 'red')
          $("#cny").fadeIn(300)
          $("#cny-change").addClass("fa-toggle-down").css('color', 'red')
          $("#cny-change").removeClass("fa-toggle-up")
        else
          $("#cny").hide().css('color', 'black')
          $("#cny").fadeIn(300)
          $("#cny-change").removeClass("fa-toggle-up").removeClass('fa-toggle-down')
      )
])