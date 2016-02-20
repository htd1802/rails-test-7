class Person < ActiveRecord::Base
  extend Enumerize
  MIN_AGE = 0

  has_one   :fathership,  dependent: :destroy
  has_one   :mothership,  dependent: :destroy
  has_one   :relationship

  has_one   :father,    class_name: Father,   through: :fathership,  source: :member
  has_one   :mother,    class_name: Mother,   through: :mothership,  source: :member

  has_many  :relationships
  has_many  :parentships, dependent: :destroy
  has_many  :childrenships, -> { where(type: [Fathership, Mothership]) }, class_name: Relationship, foreign_key: :member_id

  has_many  :parents,   class_name: Parent,   through: :parentships,    source: :member
  has_many  :sons,      class_name: Son,      through: :childrenships,  source: :person
  has_many  :daughters, class_name: Daughter, through: :childrenships,  source: :person
  has_many  :children,  class_name: Child,    through: :childrenships,  source: :person
  has_many  :brothers,            -> (object) { where.not(id: object.id).uniq }, class_name: Brother,        source: :sons,    through: :parents

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :dob,        presence: true
  validates :gender,     presence: true
  validate :ensure_valid_age

  enumerize :gender, in: [:male, :female], predicates: true

  before_save :set_name

  def age
    ((Date.today - dob) / 365).floor
  end

  def older_than(person)
    age - person.age
  end

  def father_of?(person)
    return false if !person.father
    id == person.father.id
  end

  def say_something
    "Hello, my full name is #{name}."
  end

  private

  def set_name
    self.name = first_name + ' ' + last_name
  end

  def ensure_valid_age
    return errors[:dob] << 'Invalid.' if dob? && age < self.class::MIN_AGE
  end
end
