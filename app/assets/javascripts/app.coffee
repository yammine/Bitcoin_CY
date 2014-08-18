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
      .when('/about',
        templateUrl: "about.html",
        controller: 'AboutController'
        )
])

.animation('.change-animation', ->
  enter: (element) ->
    element.css('display', 'none')
    element.fadeIn(1000)
  )