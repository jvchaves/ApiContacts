class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind

  has_many :phones

  has_one :address

  def attributes(*args)
    hash = super(*args)
    hash[:birthdate] = object[:birthdate].to_time.iso8601 unless object[:birthdate].nil?
    hash
  end
  meta do
    {author: 'João Victor Chaves'}
  end
end
