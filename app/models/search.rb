class Search < ApplicationRecord
  def self.search(search)
    search ? where('title LIKE ?', "%#{search}%") : all
  end
  has_many :cards, dependent: :destroy
end
