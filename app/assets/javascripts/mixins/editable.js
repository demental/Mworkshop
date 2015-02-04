Mworkshop.Editable = Ember.Mixin.create({
  isEditing: false,
  actions: {
    edit: function() {
      this.set('isEditing', true);
      return false;
    },
    acceptChanges: function() {
      if(typeof(this.beforeChange) == 'function') {
        this.beforeChange();
      }
      this.get('model').save();
      return false;
    }
  }
});
