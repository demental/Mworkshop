class Mworkshop.GroupsRoute extends Ember.Route
  model: ->
    @store.find('group')
