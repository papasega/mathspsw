# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every :hour, at: 0  do
  runner "Contest.check_contests_starts" # Send mail and post messages on forum for contests
end

every :day, :at => '2am' do
  runner "Record.update"           # Update statistics
  runner "Myfile.fake_dels"        # Delete old files
  runner "User.delete_unconfirmed" # Delete users with unconfirmed email
end
