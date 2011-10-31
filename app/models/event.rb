class Event
  include UniquifyMongo::Uniquify
  include Mongoid::Document
  embeds_many :responses

  unique_field :token
  unique_field :admin_token
  field :name
  field :date
  field :location
  field :host_email
  field :description
  attr_accessible :name, :date, :location, :host_email, :description

  def self.find_by_token(token)
    Event.first(conditions: {token: token})
  end
end
