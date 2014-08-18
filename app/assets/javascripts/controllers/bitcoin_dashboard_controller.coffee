angular.module('btcdash')

.controller("BitcoinDashboardController",
  ['$rootScope', '$scope', '$http', '$interval', '$timeout', 'BitcoinCurrencyApi',
  ($rootScope, $scope, $http, $interval, $timeout, BitcoinCurrencyApi) ->

    update = ->
      $scope.isLoading = true

      BitcoinCurrencyApi.update().then (data) ->
        $scope.isLoading = false
        $scope.time = data.time
        $rootScope.$broadcast('updateBitcoinPrices')

    $interval(update, $scope.updateFrequency)
    $timeout(update, 1)
])