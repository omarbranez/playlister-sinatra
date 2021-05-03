require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  use GenresController
  use ArtistsController
  use SongsController
  # add each controller as you write out their routes, or sinatra wont know they exist
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
