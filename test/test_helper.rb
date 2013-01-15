require 'rubygems'
require 'chrono_trigger'
require 'stringio'
require 'test/unit'
require 'shoulda'
require 'mocha'


def quietly
  old_stderr = $stderr
  STDERR.reopen("/dev/null", 'w')
  yield
  $stderr = old_stderr
end