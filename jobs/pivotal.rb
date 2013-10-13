require 'pivotal-tracker'
 
config_file = File.dirname(File.expand_path(__FILE__)) + '/../config/pivotal.yml'
config = YAML::load(File.open(config_file))

PivotalTracker::Client.token = config['pivotal_api_token']
@project = PivotalTracker::Project.find config['pivotal_project_id']

 
SCHEDULER.every INTERVAL, :first_in => 0 do
  if @project.is_a?(PivotalTracker::Project)

    # Velocity
    velocity = @project.current_velocity

    send_event('pivotal', { value: velocity })

  else
    puts 'Not a Pivotal project'
  end
end