class MonsterEffectsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "MonsterEffectsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
