class Mworkshop.Workshop extends DS.Model
  name: DS.attr('string')
  instructor: DS.attr('string')
  day: DS.attr('string')
  assignment_count: DS.attr('number')
  max_attendees: DS.attr('number')
  grades: DS.attr('array')
