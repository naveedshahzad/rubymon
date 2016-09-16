class Monster < ActiveRecord::Base
  #name: string, power: integer, monster_type: string
  has_and_belongs_to_many :teams
  belongs_to :user

  validate do
    errors.add(:user, "A user can create upto 20 monsters") if user.monsters.length == 21
  end
  TYPES = ["fire","water","earth","electric","wind"]
  def strong_against
   TYPES[TYPES.index(monster_type) - 1]
  end

  def strong_against?(monster)
    monster.monster_type === self.strong_against
  end

  def weak_against
   TYPES[TYPES.index(monster_type) + 1]
  end

  def weak_against?(monster)
    monster.monster_type === self.weak_against
  end
end
