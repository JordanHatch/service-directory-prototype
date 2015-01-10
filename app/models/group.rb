class Group < Struct.new(:id, :primary, :ordered)

  def id
    super.to_s
  end

  def has_primary?
    primary
  end

  def has_order?
    ordered
  end

  def to_param
    id
  end

  def self.all
    [
      self.new(:what, true, false),
      self.new(:start, false, true),
      self.new(:change, true, true),
      self.new(:help, false, false),
    ]
  end

  def self.find(group_id)
    all.find {|group| group.id == group_id }
  end

end
