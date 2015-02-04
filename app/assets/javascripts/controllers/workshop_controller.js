Mworkshop.WorkshopController = Ember.ObjectController.extend(Mworkshop.Editable, {
  grades_as_string: function() {
    if(typeof(this.get('model').get('grades')) == 'string') {
      return this.get('model').get('grades').split(',');
    }
    return this.get('model').get('grades');
  }.property('grades'),

  beforeChange: function() {
    this.get('model').set('grades', this.get('grades_as_string'));
  }
});
