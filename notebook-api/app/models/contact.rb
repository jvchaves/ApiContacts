class Contact < ApplicationRecord
  belongs_to :kind

  has_many :phones

  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def author
    "João Victor Chaves"
  end

  def kind_description
    self.kind.description rescue nil
  end

  def as_json(options = nil)
    hash = super(options)
    hash[:birthdate] = I18n.l(self[:birthdate]) unless self[:birthdate].nil?
    hash
  end
end
