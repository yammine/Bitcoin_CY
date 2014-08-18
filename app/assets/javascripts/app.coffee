btcdash = angular.module('btcdash', [
  'templates',
  'ngResource',
  'ngRoute',
  'ngAnimate'
])

btcdash.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: "dashboard.html",
        controller: 'PriceController'
        )
])
