# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  publisher  :string
#  year       :string
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Book < ActiveRecord::Base
end
