class Team < ActiveRecord::Base
  has_and_belongs_to_many :monsters
  belongs_to :user

  validate do
    errors.add(:user, "A user can create upto 3 team") if user.teams.length == 4
    errors.add(:monsters, "A team can have upto 3 monsters") if monsters.length == 4
  end
end
