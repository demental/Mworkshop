class Mworkshop.WorkshopController extends Ember.ObjectController
  isEditing: false
  actions:
    edit: () ->
      @isEditing = true
      return false

    acceptChanges: () ->
      @model.save()
      return false
