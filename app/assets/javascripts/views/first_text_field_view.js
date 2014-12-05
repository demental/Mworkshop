Mworkshop.FirstTextFieldView = Ember.TextField.extend({
  didInsertElement: function() {
    this.$().focus()
  }
});

Ember.Handlebars.helper('first-textfield', Mworkshop.FirstTextFieldView);
