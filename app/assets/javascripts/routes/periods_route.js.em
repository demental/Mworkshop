class Mworkshop.PeriodsRoute extends Ember.Route
  model: ->
    @store.find('period')