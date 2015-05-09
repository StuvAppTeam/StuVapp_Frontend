class Apartment < ActiveRecord::Base
  # Beziehung zu User, ein Datensatz gehört immer zu einem User
  belongs_to :user
  #Beziehung zu Images
  has_many :images, :dependent => :destroy
  # Zugriff auf Formularattribute von Images + Löschen der Attribute erlauben
  accepts_nested_attributes_for :images, :allow_destroy => true

  def self.search(search, phase, type, request)
    # Vorbereiten des eingegebenen String
    key = search #.map(&:inspect).join(', ')
    key = "%" + key + "%"
    key.gsub!(/"/, "")

    if request == 'Gesuche'
      req = true
    else
      req = false
    end

    where("city ILIKE ? AND phase = ? AND type = ? AND request = ?", key, phase, type, req)
   end
end
