btcdash = angular.module('btcdash', [
  'templates',
  'ngResource',
  'ngRoute'
])

btcdash.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: "test.html",
        controller: 'PriceController'
        )
])
