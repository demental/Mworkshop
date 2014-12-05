class Mworkshop.GroupsController extends Ember.ArrayController
  needs: ['application']

  grades: Ember.computed.alias('controllers.application.grades')

  actions:
    create: () ->
      return false unless (@name && @grade)
      group = @store.createRecord 'group', name: @name, grade: @grade
      @name = ''
      @grade = ''
      group.save()

      $('#new-group-name').focus()
