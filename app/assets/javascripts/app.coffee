btcdash = angular.module('btcdash', [
  'templates',
  'ngResource',
  'ngRoute'
])

btcdash.config([ '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: "dashboard.html",
        controller: 'PriceController'
        )
      .when('/about',
        templateUrl: "about.html",
        controller: 'AboutController'
        )
])
