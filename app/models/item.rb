class Item < ActiveRecord::Base
  GROUPS = ['what', 'start', 'change', 'help']

  belongs_to :service

  scope :in_step_order, -> { order('items.primary DESC, items.order ASC') }
  scope :for_group, proc {|group| where(group: group) }
  scope :primary, -> { where(primary: true) }
  scope :not_primary, -> { where(primary: false) }

  validates :name, :group, :service_id, presence: true
  validates :group, inclusion: { in: GROUPS }

  def group_instance
    Group.find(group)
  end

end
