class Parentship < Relationship
  validates :person_id, uniqueness: { scope: [:member_id, :type] }
end
