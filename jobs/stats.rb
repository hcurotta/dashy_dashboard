SCHEDULER.every '2s' do

	last_week = Time.now - 1.week
	week_before = last_week - 1.week

	# current_call_total  = DB[:calls].filter(:created_at => last_week..Time.now).count
	# prev_call_total			= DB[:calls].filter(:created_at => week_before..last_week).count

	current_call_total = 142
	prev_call_total = 100

	current_users_activated = 100

  send_event('calls', { current: current_call_total, last: prev_call_total })
  send_event('users-activated', { current: current_users_activated })
end