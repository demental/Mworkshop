class Mworkshop.WorkshopsRoute extends Ember.Route
  model: ->
    @store.find('workshop')
