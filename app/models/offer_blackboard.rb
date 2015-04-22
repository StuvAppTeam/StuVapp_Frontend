class OfferBlackboard < ActiveRecord::Base
  def self.search(search, condition, category)
    key = search #.map(&:inspect).join(', ')
    key = "%" + key + "%"
    key.gsub!(/"/, "")
 
    if condition == "Neu"
      cond = true
    elsif condition == "Gebraucht"
      cond = false
    end



    if (category == 'Alles' && condition == "Alles")
      where("title LIKE ?" ,  key  )
    elsif (category == 'Alles' && condition != "Alles")
      where("title LIKE ? AND condition = ?",  key, cond)
    elsif  condition == "Alles"
      where("title LIKE ? AND category = ? ", key, category)
    elsif condition != "Alles"
      where("title LIKE ? AND category = ? AND condition = ? ", key, category, cond)
    end
   end
end