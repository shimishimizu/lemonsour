module ReviewDecorator
  def is_new
  	created_at == updated_at
	created_at >= 3.days.ago
  end

  def is_update
  	created_at != updated_at
  	updated_at >= 3.days.ago
  end
end