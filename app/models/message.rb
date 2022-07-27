class Message < ApplicationRecord
  belongs_to :room
  broadcasts_to :room

  def to_j
    to_json(except: %i[created_at updated_at])
  end
  # after_create_commit -> { broadcast_append_to room }
  # after_destroy_commit -> { broadcast_remove_to room }
  # after_update_commit -> { broadcast_replace_to room }
end
