class Mworkshop.Group extends DS.Model
  name: DS.attr('string')
  grade: DS.attr('string')
  students: DS.hasMany('student')
