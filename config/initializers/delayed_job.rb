Delayed::Worker.destroy_failed_jobs = true
Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.read_ahead = 15
Delayed::Worker.default_queue_name = 'default'
Delayed::Worker.delay_jobs = true  # Rails.env.production? || Rails.env.staging?
