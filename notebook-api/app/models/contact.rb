class Contact < ApplicationRecord
  belongs_to :kind
  def author
    "João Victor Chaves"
  end

  def as_json(options = nil)
    super(methods: :author, root: true)
  end
end
