class Mworkshop.WorkshopController extends Ember.ObjectController
  isEditing: false
  actions:
    edit: () ->
      @isEditing = true
      return false

    acceptChanges: () ->
      @model.set('grades', @model.grades.split(','))
      @model.save()
      return false
