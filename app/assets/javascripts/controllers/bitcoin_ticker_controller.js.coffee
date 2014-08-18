angular.module('btcdash')

.controller("BitcoinTickerController", ['$scope', '$rootScope','BitcoinCurrencyApi', ($scope, $rootScope, BitcoinCurrencyApi) ->

  # Default values
  $scope.amount = null
  $scope.previousAmount =  null
  $scope.amountChange = null

  # Update the amounts when new data is received
  $scope.$on('updateBitcoinPrices', ->
    $scope.updateAmount(BitcoinCurrencyApi.amount[$scope.currencyId])
  )

  $scope.valueWentUp = -> $scope.amountChange > 0
  $scope.valueDidNotChange = -> $scope.amountChange == 0
  $scope.valueWentDown = -> $scope.amountChange < 0

  $scope.updateAmount = (newAmount) ->
    if ($scope.amount?)
      # If we already have an amount
      $scope.previousAmount = $scope.amount
      $scope.amount = newAmount
      $scope.amountChange = ($scope.amount - $scope.previousAmount).toFixed(2)
    else
      # If we don't have an amount
      $scope.previousAmount = $scope.amount = newAmount
      $scope.amountChange = null
])