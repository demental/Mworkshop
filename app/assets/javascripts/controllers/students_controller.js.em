class Mworkshop.StudentsController extends Ember.ArrayController
  needs: ['application', 'groups']
  groupsBinding: 'controllers.groups.content'
  currentGroup: ''
  didInsertElement: ()->
    @currentGroup = @store.createRecord 'group'
  actions:
    create: () ->
      return false unless (@first_name && @last_name)

      console.log @currentGroup.id

      @student = @store.createRecord 'student', first_name: @first_name, last_name: @last_name
      student = @student
      @store.find('group', @currentGroup.id).then (group)->
        student.group = group
        student.save()

      @first_name = ''
      @last_name = ''
      $('#new-student-first-name').focus()
