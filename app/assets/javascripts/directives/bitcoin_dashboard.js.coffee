angular.module('btcdash')

.directive('bitcoinDashboard', ['$http', '$interval', ($http, $interval) ->
  restrict: 'E'
  template: """
    <div class="bitcoin-dashboard-wrapper">
      <div ng-transclude class="col-sm-offset-3"></div>
      <div class="row">
        <div class="col-sm-12 text-center">
          <h4>
            <span ng-show="time">
              Last Updated at: {{time | date:'medium'}}
            </span>
            <span ng-show="!time">
              Loading...
            </span>
            <i ng-class="{changeme: true, fa: isLoading, 'fa-spin': isLoading, 'fa-circle-o-notch': isLoading}"></i>
          </h4>
        </div>
      </div>
      <div class="row">
        <div class="text-center col-sm-offset-4 col-sm-4">
          <p class="littlegrey">
            The Bitcoin Dashboard grabs price data from
            <a href="https://www.bitcoinaverage.com">https://www.bitcoinaverage.com</a>
            every {{updateFrequencySeconds}} seconds. In the event of the API becoming
            unresponsive the most recently stored price will be displayed.
          </p>
        </div>
      </div>
    </div>
  """

  transclude: true
  scope:
    updateFrequency: '@'

  link: (scope, el, attrs) ->
    scope.currencyIds = []
    scope.data = {}
    scope.updateFrequencySeconds = parseInt(scope.updateFrequency) / 1000
    
  controller: 'BitcoinDashboardController'
])