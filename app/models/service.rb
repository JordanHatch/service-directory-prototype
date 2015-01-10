class Service < ActiveRecord::Base
  has_many :items

  validates :name, presence: true

  def items_in_groups
    items.in_step_order.group_by(&:group)
  end

  def items_for_group(group)
    items_in_groups[group.to_s]
  end

  def primary_item_for_group(group)
    items.for_group(group).primary.first
  end
end
