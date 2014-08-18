angular.module('btcdash')

.directive('bitcoinTicker', ['BitcoinCurrencyApi', (BitcoinCurrencyApi) ->
  restrict: 'E'
  replace: true
  controller: 'BitcoinTickerController'
  template: """
    <div class="col-sm-4">
      <div class="straight-edge well text-center">
        <h2 class="currency-header">
          <img ng-src="assets/{{currencyId}}.png" alt="{{ethnicity}} Flag">
          {{currencyId | uppercase}} <i class="fa fa-usd fa-1x"></i>/<i class="fa fa-btc fa-1x"></i>
        </h2>

        <div class="price-box">
          <h1 id="{{currencyId}}"
              ng-class="{'positive-change': valueWentUp(), 'negative-change': valueWentDown(), 'no-change': valueDidNotChange()}">
             <span ng-show="amount">
              {{amount | currency}}
              </span>
           </h1>
        </div>

        <p class="littlegrey">
          <span ng-show="previousAmount">
            Previous: {{ previousAmount | currency }}
          </span>
        </p>

        <div class="row">
          <div class="col-sm-6">
            <h3>
              <span ng-show="amountChange">
                {{amountChange}} <i id="{{currencyId}}-change" class="fa fa-1x"></i>
              </span>
            </h3>
          </div>
        </div>
      </div>
   </div>
  """

  scope:
    currencyId: '@'
    ethnicity: '@'

  link: (scope, el, attrs) ->
    BitcoinCurrencyApi.addCurrencyId(scope.currencyId)

])