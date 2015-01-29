class Mworkshop.Student extends DS.Model
  name: DS.attr('string')
  group: DS.belongsTo('group', async: true)
  happiness: DS.attr('number')
