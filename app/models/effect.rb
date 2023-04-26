class Effect < ApplicationRecord
    # after_create_commit { broadcast_effect }
  
    # private
  
    # def broadcast_effect
      # ActionCable.server.broadcast('EffectsChannel', {
      #   id: id,
      #   name: name
      # })
    # end
  end
