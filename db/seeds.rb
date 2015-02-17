puts 'Clearing any existing Item data...'
Item.destroy_all
 
# Learn about how `find_or_create_by` works:
#  http://apidock.com/rails/v4.0.2/ActiveRecord/Relation/find_or_create_by
 
puts 'Adding item types...'
ItemType.find_or_create_by!(name: 'Magazine Article')
ItemType.find_or_create_by!(name: 'Book')
ItemType.find_or_create_by!(name: 'Movie')
ItemType.find_or_create_by!(name: 'TV Show')
 
puts 'Done.'