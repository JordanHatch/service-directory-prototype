class Item < ActiveRecord::Base
  GROUPS = ['what', 'start', 'change', 'help']
  PROVIDERS = [
    'government',
    'local-authority',
    'supplier',
    'independent-body',
    'employer',
    'not-provided',
  ]
  LOCATIONS = [
    'on-gov-uk',
    'online',
    'offline',
  ]

  belongs_to :service

  scope :in_step_order, -> { order('items.order ASC') }
  scope :for_group, proc {|group| where(group: group) }
  scope :primary, -> { where(primary: true) }
  scope :not_primary, -> { where(primary: false) }

  validates :name, :group, :service_id, presence: true
  validates :group, inclusion: { in: GROUPS }
  validates :provider, inclusion: { in: PROVIDERS, allow_blank: true }
  validates :location, inclusion: { in: LOCATIONS, allow_blank: true }

  def group_instance
    Group.find(group)
  end

end
