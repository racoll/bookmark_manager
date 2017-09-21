require "data_mapper"
require "dm-postgres-adapter"

require_relative "models/tags"
require_relative "models/link"

require 'pry'

# ENV['RACK_ENV'] = 'test'
# binding.pry
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
