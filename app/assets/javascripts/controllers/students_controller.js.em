class Mworkshop.StudentsController extends Ember.ArrayController
  needs: ['application']
  grades: Ember.computed.alias('controllers.application.grades')
  states: Ember.computed.alias('controllers.application.states')
