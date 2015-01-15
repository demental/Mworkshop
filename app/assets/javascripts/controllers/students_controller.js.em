class Mworkshop.StudentsController extends Ember.ArrayController
  needs: ['application', 'groups']
  groupsBinding: 'controllers.groups.content'
  currentGroup: ''
  didInsertElement: ()->
    @currentGroup = @store.createRecord 'group'
  actions:
    create: () ->
      return false unless (@name)

      console.log @currentGroup.id

      @student = @store.createRecord 'student', name: @name
      student = @student
      @store.find('group', @currentGroup.id).then (group)->
        student.group = group
        student.save()

      @name = ''
      $('#new-student-name').focus()
