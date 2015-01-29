class Mworkshop.WorkshopsController extends Ember.ArrayController
  needs: ['application']
  actions:
    create: () ->
      return false unless (@name && @instructor && @day && @max_attendees && @grades)

      @workshop = @store.createRecord 'workshop',
                    name: @name,
                    instructor: @instructor,
                    day: @day,
                    max_attendees: @max_attendees,
                    grades: @grades.split(',')
      workshop = @workshop
      workshop.save()

      @name=''
      @instructor = ''
      @day = ''
      @max_attendees = ''
      @grades = ''
      $('#new-workshop-name').focus()
