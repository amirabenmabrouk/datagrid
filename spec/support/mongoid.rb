require "rubygems"
require 'mongoid'


Mongoid.from_hash({
  "host" => "localhost",
  "database" =>"datagrid_mongoid",
  "autocreate_indexes" => true,
})

#Mongoid.logger = TEST_LOGGER #TODO: understand why still output to STDOUT
Mongoid.logger = nil


class MongoidEntry

  include Mongoid::Document
  include Mongoid::Timestamps
  #include Datagrid::Drivers::Mongoid

  field :group_id, :type => Integer
  field :name, :type => String
  field :category, :type => String
  field :disabled, :default => false, :type => Boolean
  field :confirmed, :default => false, :type => Boolean
  field :shipping_date, :type => DateTime

end

class MongoidGrid
  include ::Datagrid

  scope do
    MongoidEntry
  end
end
