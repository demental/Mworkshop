class Mworkshop.Student extends DS.Model
  first_name: DS.attr('string'),
  last_name: DS.attr('string'),
  group: DS.belongsTo('group', async: true)
