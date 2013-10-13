require 'time-lord'
# require 'chronic'

SCHEDULER.every INTERVAL do


	approved = DB[:salespeople].filter(:status => 'new').limit(8).reverse_order(:id)

	all_new = []

	approved.each { |salesperson| 
		all_new << {:label => "#{salesperson[:first_name]} #{salesperson[:last_name]}", 
								:value => (Time.now - salesperson[:created_at]).to_i.seconds.ago.to_words } 
	}
  
  send_event('new-users', { items: all_new })
end