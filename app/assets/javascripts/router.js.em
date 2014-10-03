# For more information see: http://emberjs.com/guides/routing/

Mworkshop.Router.map ->
  @resource 'students', path: '/'
  @resource 'workshops', path: '/ateliers'
  @resource 'assignments'
  @resource 'groups'
  @resource 'periods', path: '/config'

