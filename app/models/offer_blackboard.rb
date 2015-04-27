class OfferBlackboard < ActiveRecord::Base
  #Beziehung zu User, ein Datensatz gehört immer zu einem User
  belongs_to :user
  #Beziehung zur Kategorie, ein Datensatz gehört immer zu einer Kategorie
  belongs_to :category
  def self.search(search, condition, category)
    key = search #.map(&:inspect).join(', ')
    key = "%" + key + "%"
    key.gsub!(/"/, "")

    if condition == "Neu"
      cond = true
    elsif condition == "Gebraucht"
      cond = false
    end



    if (category == '' && condition == "Alles")
      where("title ILIKE ?" ,  key  )
    elsif (category == '' && condition != "Alles")
      where("title ILIKE ? AND condition = ?",  key, cond)
    elsif  condition == "Alles"
      where("title ILIKE ? AND category_id = ? ", key, category)
    elsif condition != "Alles"
      where("title ILIKE ? AND category_id = ? AND condition = ? ", key, category, cond)
    end
   end
end
