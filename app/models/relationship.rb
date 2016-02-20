class Relationship < ActiveRecord::Base
  extend Enumerize

  MIN_AGE = 0

  belongs_to :person
  belongs_to :member, class_name: Person

  validates :person_id,     presence: true
  validates :member_id,     presence: true

  validate :ensure_valid_age

  enumerize :type, in: [:Fathership, :Mothership], predicates: true

  private

  def ensure_valid_age
    return errors[:member_id] << "#{type_text} must be over self.class::MIN_AGE" if member && member.age < self.class::MIN_AGE
  end
end
