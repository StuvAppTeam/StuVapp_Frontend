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
  def self.search(search, condition, category, request)
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

    if request == 'Gesuche'
      req = true
    else
      req = false
    end


    # Fallunterscheidung für verschiedene Eingaben
    if (category == '' && condition == "Alles")
      where("title ILIKE ? AND description ILIKE ? AND request = ?" ,  key, key, req)
    elsif (category == '' && condition != "Alles")
      where("title ILIKE ? AND description ILIKE ? AND condition = ? AND request = ?",  key, key, cond, req)
    elsif  condition == "Alles"
      where("title ILIKE ? AND description ILIKE ? AND category_id = ? AND request = ?", key, key, category, req)
    elsif condition != "Alles"
      where("title ILIKE ? AND description ILIKE ? AND category_id = ? AND condition = ? AND request = ?", key, key, category, cond, req)
    end
   end
end
