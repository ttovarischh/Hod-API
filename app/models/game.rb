class Game < ApplicationRecord
    validates_uniqueness_of :id
    has_many :players, dependent: :destroy
    has_many :monsters, dependent: :destroy
    belongs_to :user

    def to_param
        # [id, code.parameterize].join("-")
        code.parameterize
    end

    def self.find_by_param(code)
        find_by_code(code)
      end
end
