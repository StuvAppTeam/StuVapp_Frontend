class OfferBlackboard < ActiveRecord::Base
  # Beziehung zu User, ein Datensatz gehört immer zu einem User
  belongs_to :user
  # Beziehung zur Kategorie, ein Datensatz gehört immer zu einer Kategorie
  belongs_to :category

  #Beziehung zu Images
  has_many :images, :dependent => :destroy
  # Zugriff auf Formularattribute von Images + Löschen der Attribute erlauben
  accepts_nested_attributes_for :images, :allow_destroy => true

  # Suchfunktion für Angebote im schwarzen Brett
  def self.search(search, condition, category)
    # Vorbereiten des eingegebenen String
    key = search #.map(&:inspect).join(', ')
    key = "%" + key + "%"
    key.gsub!(/"/, "")

    # Verarbeitung der Zustandsvariablen
    if condition == "Neu"
      cond = true
    elsif condition == "Gebraucht"
      cond = false
    end


    # Fallunterscheidung für verschiedene Eingaben
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
