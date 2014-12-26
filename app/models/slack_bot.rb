require "net/http"

class SlackBot
  def self.talk message
    new(message).talk
  end

  attr_reader :message

  def initialize message
    @message = message
  end

  def talk
    Net::HTTP.post_form uri, payload: payload.to_json
  end

  private

  def payload
    payload = { text: message, username: "Time.ly" }
  end

  def uri
    URI.parse "https://hooks.slack.com/services/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"
  end
end
