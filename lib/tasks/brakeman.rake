# frozen_string_literal: true

# a word of caution from the Brakeman docs:
#
# "Running Brakeman via Rake is discouraged because it loads the entire Rails
# application. This is unnecessary and can cause strange behavior."
#
# A cursory web search turns up a very old (2015) GitHub issue where someone reports unexpected
# behavior, which a Brakeman maintainer speculates is due to the Rake task usage:
# "Also, I don't recommend using the Rake task if you don't have to...it loads your entire
# Rails app which is not needed. Probably one of those dependencies is stepping on some of
# Brakeman's toes..."
#
# Though the docs then go on to provide a simple example Rake task.  See
# https://brakemanscanner.org/docs/rake/
# https://github.com/presidentbeef/brakeman/issues/1444
# https://github.com/presidentbeef/brakeman/issues/629#issuecomment-76483731
#
# because it's nice to have a Rake task, and because of
# the above warnings, isolate it in its own process.
namespace :brakeman do
  desc 'Run Brakeman in its own process (to avoid app dependencies stepping on Brakeman)'
  task run_in_child_process: :environment do
    # using pipeline and not capturing output means output goes straight to terminal, with color
    status_list = Open3.pipeline(['bin/brakeman'])

    # we only ran one command, so there's just the one Process::Status
    exit_status = status_list.first.exitstatus

    # bubble up any non-zero exit status
    Kernel.exit(exit_status) unless exit_status.zero?
  end
end
