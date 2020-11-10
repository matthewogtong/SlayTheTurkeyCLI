require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require_all 'app'
require_all 'lib'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.logger = nil
