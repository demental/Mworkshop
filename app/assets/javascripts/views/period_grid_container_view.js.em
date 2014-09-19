class Mworkshop.PeriodGridContainerView extends Ember.View
  attributeBindings: ['style']
  style: 'height: 430px; overflow:auto'
  didInsertElement: ->
    # debugger
    @grid = jQuery("##{@elementId}")
    @grid.handsontable
      data: @model.toArray(),
      dataSchema: @newPeriod,
      contextMenu: true,
      colHeaders: ['Name', 'State'],
      rowHeaders: true,
      stretchH: 'all',
      minSpareRows: 0,
      columns: [
        {data: @property("name")},
        {data: @property("state")}
      ]
    @grid.find('table').addClass('table')
  property:(attr) ->
    (period, value) ->
      if(!value)
        period.get(attr)
      else
        period.set(attr,value)
        period.save()
  newPeriod: ->
    # debugger
    Mworkshop.__container__.lookup('store:main').createRecord 'period'
