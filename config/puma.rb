=begin
-----------------------------------------------------------------------------------------
                        FOR DEVELOPMENT (comment it for production)
-----------------------------------------------------------------------------------------
=end

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart


# --------------------------------------------------------------------------------------------
#                               END OF DEVELOPMENT
# --------------------------------------------------------------------------------------------




=begin
-----------------------------------------------------------------------------------------
                        FOR PRODUCTION (comment it for development)
-----------------------------------------------------------------------------------------
=end

# # Change to match your CPU core count
# workers 2

# # Min and Max threads per worker
# threads 1, 6

# app_dir = File.expand_path("../..", __FILE__)
# shared_dir = "#{app_dir}/shared"

# # Default to production
# rails_env = ENV['RAILS_ENV'] || "production"
# environment rails_env

# # Set up socket location
# bind "unix://#{shared_dir}/sockets/puma.sock"

# # Logging
# stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# # Set master PID and state locations
# pidfile "#{shared_dir}/pids/puma.pid"
# state_path "#{shared_dir}/pids/puma.state"
# activate_control_app

# on_worker_boot do
#   require "active_record"
#   ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
#   ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
# end

# --------------------------------------------------------------------------------------------
#                               END OF PRODUCTION
# --------------------------------------------------------------------------------------------
