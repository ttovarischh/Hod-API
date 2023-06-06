# class PlayersChannel < ApplicationCable::Channel
#   def subscribed
#     stream_from "PlayersChannel"
#     puts "Subscribed to PlayersChannel"
#   end

#   def unsubscribed
#     # Any cleanup needed when channel is unsubscribed
#   end
# end

class PlayersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "PlayersChannel"
    puts "Subscribed to PlayersChannel"
  end

  def unsubscribed
    puts "Unsubscribed from channel: #{params}"
    stop_all_streams
  end

  def receive(data)
    puts "Received data in PlayersChannel: #{data}"
  end

  def speak(data)
    puts "Broadcasting data from PlayersChannel: #{data}"
    ActionCable.server.broadcast('PlayersChannel', data)
  end

  def subscribed_to_channel
    puts "Received subscription confirmation from PlayersChannel"
  end
end