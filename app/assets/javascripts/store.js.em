class Mworkshop.ApplicationStore extends DS.Store

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
class Mworkshop.ApplicationAdapter extends DS.FixtureAdapter
