class Mworkshop.GroupsController extends Ember.ArrayController
  needs: ['application']

  gradesBinding: 'controllers.application.grades'

  actions:
    create: () ->
      return false unless (@name && @grade)
      group = @store.createRecord 'group', name: @name, grade: @grade
      @name = ''
      @grade = ''
      group.save()

      $('#new-group-name').focus()
