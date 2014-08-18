angular.module('btcdash')

.factory('BitcoinCurrencyApi', ['$http', ($http) ->
  class ApiClient
    constructor: ->
      @currencyIds = []
      @time = null
      @amount = {}

    addCurrencyId: (currencyId) ->
      @currencyIds.push(currencyId)

    update: ->
      currencyIds = @currencyIds
      self = @

      $http.get('/latest_price.json').then((response) ->
        data = response.data
        amount = {}

        # Extract the relevant currencies from the response
        angular.forEach data, (value, key) ->
          currencyId = key.toString().toLowerCase()

          if currencyId in currencyIds
            amount[currencyId] = value

        # Update the amounts and recently updated time on the object
        self.time = data.time
        self.amount = amount

        # Return an object with the currencies and time
        time: self.time
        amount: self.amount
      )

  new ApiClient
])