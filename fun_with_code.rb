# Happy Programmer's Day - 13th September 2015
# Fun with code obfuscation
# Author: Supreeth Burji
require 'highline/import'

alphabets = ask('Enter your favorite English alphabets: ')
def point_to_code(point)
  point.codepoints.first
end

def look_up_the(alphabet)
  LOOKUP[alphabet % LENS]
end

# cipher intializations
CIPHER = 'NQNBFONFVPBFPYBWHERBFQNEGBFREYNATBFSBEGUBFTBBFUGZYBFVPBABFWNINBFXBGYVABFYVFCBFZNKVZNBFARFPBFBOWRPGVIR PBFCLGUBABFDCYBFEHOLBFFZNYYGNYXBFGRKBFHAVPBABFINYNBFJBYSENZBFKGRAQBFLBEVPXBFMCYBFRATVARREVAT VZCNPG N YBG BS PERQVG TBRF GB GUR OEVYYVNAG NAQ NPGVIR BCRA FBHEPR PBZZHAVGLBFRKNZCYRF BS BCRA FBHEPR CEBTENZZVAT YNATHNTRF NERBF'
HAPPY_PROGRAMMERS = Time.new(2015, 9, 13)
duh, woah, stop = ' ', '!', '.'

# hints
HINT = duh.strip.concat(point_to_code(woah) + point_to_code(stop)).concat(point_to_code(woah) + point_to_code(stop) + HAPPY_PROGRAMMERS.day - HAPPY_PROGRAMMERS.month)
key = HINT.split(//).map {|c| duh.strip.concat(point_to_code(c) - HAPPY_PROGRAMMERS.day)}.join
LENS = [woah, duh].inject(0) { |glass, broken| glass += point_to_code(broken) }

LOOKUP = CIPHER.split(key).inject([]) do |clear, text|
  text.split(//).each do |c|
    ceaser = point_to_code(c) - HAPPY_PROGRAMMERS.day
    clear << duh.strip.concat(ceaser < LENS ? ceaser + 2 * HAPPY_PROGRAMMERS.day : ceaser)
  end
  clear << HINT
end.join.split(HINT).map { |w| w.capitalize }

# console output
puts "\nHAPPY PROGRAMMER'S DAY - #{ HAPPY_PROGRAMMERS.strftime('%d %B %Y') }\n\n#{ LOOKUP[-2].gsub('-', duh) }, #{ HINT } it is ...!"
output = alphabets.upcase.codepoints.inject([]) { |favorite, alphabet|
  favorite << look_up_the(alphabet)
}.compact.uniq.join(duh).strip
puts "#{ output.empty? ? 'Invalid input, try again smarty pants ...!' : 'Based on your input, ' + LOOKUP[-1].gsub('-', duh) + ': ' + output }\n\n"
