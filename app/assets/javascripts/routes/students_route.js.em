class Mworkshop.StudentsRoute extends Ember.Route

  model: ->
    @store.find('student')
