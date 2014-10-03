class Mworkshop.Group extends DS.Model
  name: DS.attr('string'),
  grade: DS.belongsTo('grade')
