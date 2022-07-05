class Goliard < ActiveRecord::Base
  attr_accessible :name, :surname, :process_date, :address, :mobile, :goliardic_name, :noble_name, :order_id, :user_id, 
    :subscription, :subscription_stamps, :email, :scazzi_count, :private_mail_mail, :private_cell, :private_address, 
    :photo, :faculty_id, :points, :male, :title, :public
end
