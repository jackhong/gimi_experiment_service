

module GIMI
  module ExperimentService; end
end


if __FILE__ == $0
  # Run the service
  #
  require 'gimi/exp_service/server'

  opts = {
    :app_name => 'exp_server',
    :port => 8023,
    # :am => {
      # :manager => lambda { OMF::SFA::AM::AMManager.new(OMF::SFA::AM::AMScheduler.new) }
    # },
    :ssl => {
      :cert_file => File.expand_path("~/.gcf/am-cert.pem"),
      :key_file => File.expand_path("~/.gcf/am-key.pem"),
      :verify_peer => true
      #:verify_peer => false
    },
    #:log => '/tmp/am_server.log',
    :dm_db => 'sqlite:///tmp/gimi_test.db',
    :dm_log => '/tmp/gimi_exp_server-dm.log',
    :rackup => File.dirname(__FILE__) + '/exp_service/config.ru',

  }
  GIMI::ExperimentService::Server.new.run(opts)

end
