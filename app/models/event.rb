class Event
  include UniquifyMongo::Uniquify
  include Mongoid::Document

  unique_field :token
  field :name
  field :date
  field :location
  field :host_email
  field :description
  attr_accessible :name, :date, :location, :host_email, :description
end
