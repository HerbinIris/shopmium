class Shop < ActiveRecord::Base
  acts_as_mappable :lat_column_name => :latitude,
		   :lng_column_name => :longitude,
                   :distance_field_name => :distance
  
  filterrific(
    default_filter_params: { sorted_by: 'name_asc' },
    available_filters: [
      :sorted_by,
      :search_query,   
      :distance,
      :nearest, 
    ]
  )

  scope :search_query, -> (name) { where("name like ?", "#{name}%")}
 
  scope :distance, lambda { |distance_attrs|
    return nil  if distance_attrs[:rayon].empty? || distance_attrs[:longitude].empty? || distance_attrs[:latitude].empty? 
    Shop.within(distance_attrs[:rayon], :origin => [distance_attrs[:latitude], distance_attrs[:longitude]])
  }

  scope :nearest, lambda { |nearest_attrs|
    return nil  if nearest_attrs[:number].empty? || nearest_attrs[:longitude].empty? || nearest_attrs[:latitude].empty?
    Shop.by_distance(:origin => [nearest_attrs[:latitude], nearest_attrs[:longitude]]).limit(nearest_attrs[:number])
  }
 

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("shops.created_at #{ direction }")
    when /^name_/
      order("shops.name #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Creation', 'created_at_desc'],
    ]
  end

end


