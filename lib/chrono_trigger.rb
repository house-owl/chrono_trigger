$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

if RUBY_VERSION =~ /1\.8\.6/
  require "activerecord"
else
  require "active_record"
end

require 'active_support/all'
require "chrono_trigger/version"
require "chrono_trigger/shell"
require "chrono_trigger/trigger"
require "chrono_trigger/cron_entry"
