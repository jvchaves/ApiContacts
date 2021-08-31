class Contact < ApplicationRecord
  belongs_to :kind
  def author
    "João Victor Chaves"
  end
  def kind_description
    self.kind.description
  end
  def as_json(options = nil)
    super(
      methods: [:kind_description, :author],
      root: true,
      # include: { kind: {only: :description}}
      )
  end
end
