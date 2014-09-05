class Mworkshop.Grade extends DS.Model
  name: DS.attr('string'),
  groups: DS.hasMany('group')
