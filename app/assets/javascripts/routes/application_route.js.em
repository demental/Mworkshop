class Mworkshop.ApplicationRoute extends Ember.Route
  setupController: (controller)->
    Em.$.getJSON('api/v1/enums.json').then (data)->
      controller.set('grades', data['grades'])
      controller.set('states', data['states'])
