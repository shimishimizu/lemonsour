module InformationDecorator
  def is_new_info
  	created_at == updated_at and created_at >= 7.days.ago
  end

  def is_both_info
  	created_at != updated_at and created_at >= 7.days.ago and updated_at >= 7.days.ago
  end

  def is_update_info
  	created_at != updated_at and updated_at >= 7.days.ago
  end
end
