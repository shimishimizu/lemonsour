module ReviewDecorator
  def is_new
  	created_at == updated_at and created_at >= 3.days.ago
  end

  def is_both
  	created_at != updated_at and created_at >= 3.days.ago and updated_at >= 3.days.ago
  end

  def is_update
  	created_at != updated_at and updated_at >= 3.days.ago
  end

end