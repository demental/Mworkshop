class Mworkshop.StudentController extends Ember.ObjectController
  isEditing: false,

  actions:
    editStudent: () ->
      @isEditing = true
      return false

    acceptChanges: () ->
      @model.save()
      return false
