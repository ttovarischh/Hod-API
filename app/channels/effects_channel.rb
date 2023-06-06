class EffectsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "EffectsChannel"
  end

  def unsubscribed
  end
end
