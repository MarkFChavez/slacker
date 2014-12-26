class SlackWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    minutely
  end
  sidekiq_options retry: false

  def perform
    SlackBot.talk(reminder.description) if reminder
  end

  private

  def reminder
    Reminder.limit(1).order("RANDOM()").first
  end
end
