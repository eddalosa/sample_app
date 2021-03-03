class AddTimestampToBlogs < ActiveRecord::Migration[6.0]
  def change
  	# backfill existing record with created_at and updated_at
  	  # values making clear that the records are faked
  	  long_ago = DateTime.new(2000, 1, 1)
  	  Blog.update_all(created_at: long_ago, updated_at: long_ago)
  	# change not null constraints
  	  change_column_null :blogs, :created_at, false
  	  change_column_null :blogs, :updated_at, false
  end
end
