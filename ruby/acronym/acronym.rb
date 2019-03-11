class Acronym
  def self.abbreviate(phrase)
    phrase.
    gsub('-', ' ').
    split(' ').
    map{|snippet| snippet[0].upcase}.
    join
  end
end
