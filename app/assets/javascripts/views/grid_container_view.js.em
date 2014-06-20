class Mworkshop.GridContainerView extends Ember.View
  didInsertElement: ->
    #debugger
    @grid = jQuery("##{@elementId}")
    @grid.handsontable
      data: @model.toArray(),
      colHeaders: ['ID', 'First Name', 'Last Name'],
      columns: [
        {data: @property("id")},
        {data: @property("first_name")},
        {data: @property("last_name")}
      ]
    @grid.find('table').addClass('table')
  property:(attr) ->
    (row, value) ->
      row.get(attr)
