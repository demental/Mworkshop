class Mworkshop.StudentsController extends Ember.ArrayController
  needs: ['application']

  # grades: Ember.computed.alias('controllers.application.grades')
  # states: Ember.computed.alias('controllers.application.states')
  actions:
    create: () ->
      return false unless (@first_name && @last_name)
      student = @store.createRecord 'student', first_name: @first_name, last_name: @last_name
      @first_name = ''
      @last_name = ''
      student.save()

      $('#new-student-first-name').focus()
