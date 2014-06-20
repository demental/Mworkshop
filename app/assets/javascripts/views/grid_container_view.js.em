class Mworkshop.GridContainerView extends Ember.View
  didInsertElement: ->
    # debugger
    @grid = jQuery("##{@elementId}")
    @grid.handsontable
      data: [
        {
          id: 1,
          first_name: 'Toto',
          last_name: 'Tata'
        }
      ]