btcdash = angular.module('btcdash', [
  'templates',
  'ngRoute',
  'controllers'
])

btcdash.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: "index.html",
        controller: 'PriceController'
        )
])

controllers = angular.module('controllers', [])
controllers.controller("PriceController", ['$scope',
  ($scope) ->
])