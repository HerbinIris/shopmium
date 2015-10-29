class Shop < ActiveRecord::Base

  filterrific(
     default_filter_params: { sorted_by: 'name_asc' },
     available_filters: [
       :sorted_by,
       :search_query,    
     ]
  )


  scope :search_query, -> (name) { where("name like ?", "#{name}%")}



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
      ['Creation', 'created_at_asc'],
    ]
  end

end


