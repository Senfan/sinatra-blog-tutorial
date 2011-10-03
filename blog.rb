require 'sinatra/base'
require 'data_mapper'

class Blog < Sinatra::Base

  # Connect to database
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

  configure do
    # Required to use PUT method
    set :method_override, true

    # Set views and public folders
    set :views, settings.root + '/app/views'
    set :public_folder, settings.root + "/app/assets"
  end

  # Require Models & Controllers
  Dir.glob("#{Dir.pwd}/app/models/*.rb") { |m| require "#{m.chomp}" }
  Dir.glob("#{Dir.pwd}/app/controllers/*.rb") { |m| require "#{m.chomp}" }

  DataMapper.finalize
  DataMapper::auto_upgrade!

end
