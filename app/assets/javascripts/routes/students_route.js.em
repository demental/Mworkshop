class Mworkshop.StudentsRoute extends Ember.Route

  model: ->
    @store.find('student')

  setupController: (controller, model)->
    controller.model = model
    @controllerFor('groups').set('model', @store.find('group'))
