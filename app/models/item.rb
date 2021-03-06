class Item < ApplicationRecord
  has_one :stock,inverse_of: :item, :dependent => :destroy
  accepts_nested_attributes_for :stock

  belongs_to :unit
  belongs_to :item_group

  has_many :purchase_items
  has_many :sales

  validates :name, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 64}
  validates :unit_id, presence: true
  validates :item_code, presence: true, length: {minimum: 1, maximum: 16}
  validates :description, presence: true, length: {maximum: 256}

  def self.search(search)
    if search
      where("lower(name) like ? ","%#{search.downcase}%").order("name ASC")
    else
      all.order("name ASC")
    end
  end
end
