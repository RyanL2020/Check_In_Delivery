require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #Allows the method to be overridden 
#if params[:_method] is set. This is the middleware which supports the PUT and DELETE HTTP method types.
run ApplicationController
use DeliveriesController
use UsersController
use SessionsController
