class Mworkshop.GridContainerView extends Ember.View
  attributeBindings: ['style']
  style: 'height: 430px; overflow:auto'
  didInsertElement: ->
    # debugger
    @grid = jQuery("##{@elementId}")
    @grid.handsontable
      data: @model.toArray(),
      dataSchema: @newStudent,
      contextMenu: true,
      colHeaders: ['First Name', 'Last Name'],
      rowHeaders: true,
      stretchH: 'all',
      minSpareRows: 0,
      columns: [
        # {data: @property("id")},
        {data: @property("first_name")},
        {data: @property("last_name")}
      ]
    @grid.find('table').addClass('table')
  property:(attr) ->
    (student, value) ->
      if(!value)
        student.get(attr)
      else
        student.set(attr,value)
        student.save
  newStudent: ->
    # debugger
    Mworkshop.__container__.lookup('store:main').createRecord 'student'
