require 'sinatra/base'

class Blog < Sinatra::Base
  
  # Connect to database
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

  # Require Models & Controllers
  Dir.glob("#{Dir.pwd}/app/models/*.rb") { |m| require "#{m.chomp}" }
  Dir.glob("#{Dir.pwd}/app/controllers/*.rb") { |m| require "#{m.chomp}" }

  # Set views and public folders
  set :views, settings.root + '/app/views'
  set :public_folder, settings.root + "/app/assets"

  get '/' do
    haml :index
  end

end
