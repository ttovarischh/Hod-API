class PlayereffectsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "PlayereffectsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end