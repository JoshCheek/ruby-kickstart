# encoding: utf-8

RSpec.describe 'alternate_words' do
  { "Lorem ipsum dolor sit amet." => ["Lorem", "dolor", "amet"],
    "Can't we all get along?"     => ["Can't", "all", "along"],
    "Elementary, my dear Watson!" => ["Elementary", "dear"],

    # and now for a bunch of Richard Stallman quotes ^_^
    "I could have made money this way, and perhaps amused myself writing code. But I knew that at the end of my career, I would look back on years of building walls to divide people, and feel I had spent my life making the world a worse place." => ["I", "have", "money", "way", "perhaps", "myself", "code", "I", "that", "the", "of", "career", "would", "back", "years", "building", "to", "people", "feel", "had", "my", "making", "world", "worse"],
    "I'm always happy when I'm protesting." => ["I'm", "happy", "I'm"],
    "Geeks like to think that they can ignore politics, you can leave politics alone, but politics won't leave you alone." => ["Geeks", "to", "that", "can", "politics", "can", "politics", "but", "won't", "you"],
    "People sometimes ask me if it is a sin in the Church of Emacs to use vi. Using a free version of vi is not a sin; it is a penance. So happy hacking." => ["People", "ask", "if", "is", "sin", "the", "of", "to", "vi", "a", "version", "vi", "not", "sin", "is", "penance", "happy"],
    "If programmers deserve to be rewarded for creating innovative programs, by the same token they deserve to be punished if they restrict the use of these programs." => ["If", "deserve", "be", "for", "innovative", "by", "same", "they", "to", "punished", "they", "the", "of", "programs"],
    "Fighting patents one by one will never eliminate the danger of software patents, any more than swatting mosquitoes will eliminate malaria." => ["Fighting", "one", "one", "never", "the", "of", "patents", "more", "swatting", "will", "malaria"],
    "People said I should accept the world. Bullshit! I don't accept the world." => ["People", "I", "accept", "world", "I", "accept", "world"],
    "Giving the Linus Torvalds Award to the Free Software Foundation is a bit like giving the Han Solo Award to the Rebel Alliance." => ["Giving", "Linus", "Award", "the", "Software", "is", "bit", "giving", "Han", "Award", "the", "Alliance"],
    "Would a dating service on the net be frowned upon . . . ? I hope not. But even if it is, don’t let that stop you from notifying me via net mail if you start one." => ["Would", "dating", "on", "net", "frowned", "I", "not", "even", "it", "don’t", "that", "you", "notifying", "via", "mail", "you", "one"],
    "Once GNU is written, everyone will be able to obtain good system software free, just like air." => ["Once", "is", "everyone", "be", "to", "good", "software", "just", "air"],
    "If you want to accomplish something in the world, idealism is not enough--you need to choose a method that works to achieve the goal. In other words, you need to be pragmatic." => ["If", "want", "accomplish", "in", "world", "is", "enough", "need", "choose", "method", "works", "achieve", "goal", "other", "you", "to", "pragmatic"],
    "No person, no idea, and no religion deserves to be illegal to insult, not even the Church of Emacs." => ["No", "no", "and", "religion", "to", "illegal", "insult", "even", "Church", "Emacs"],
    "Today many people are switching to free software for purely practical reasons. That is good, as far as it goes, but that isn't all we need to do! Attracting users to free software is not the whole job, just the first step." => ["Today", "people", "switching", "free", "for", "practical", "That", "good", "far", "it", "but", "isn't", "we", "to", "Attracting", "to", "software", "not", "whole", "just", "first"],
    "If in my lifetime the problem of non-free software is solved, I could perhaps relax and write software again. But I might instead try to help deal with the world's larger problems. Standing up to an evil system is exhilarating, and now I have a taste for it." => ["If", "my", "the", "of", "free", "is", "I", "perhaps", "and", "software", "But", "might", "try", "help", "with", "world's", "problems", "up", "an", "system", "exhilarating", "now", "have", "taste", "it"],
    "I see nothing unethical in the job it does. Why shouldn't you send a copy of some music to a friend?" => ["I", "nothing", "in", "job", "does", "shouldn't", "send", "copy", "some", "to", "friend"],
    "Free software is a matter of liberty, not price. To understand the concept, you should think of free as in free speech, not as in free beer." => ["Free", "is", "matter", "liberty", "price", "understand", "concept", "should", "of", "as", "free", "not", "in", "beer"],
    "For personal reasons, I do not browse the web from my computer. (I also have not net connection much of the time.) To look at page I send mail to a demon which runs wget and mails the page back to me. It is very efficient use of my time, but it is slow in real time." => ["For", "reasons", "do", "browse", "web", "my", "I", "have", "net", "much", "the", "To", "at", "I", "mail", "a", "which", "wget", "mails", "page", "to", "It", "very", "use", "my", "but", "is", "in", "time"],
    "Playfully doing something difficult, whether useful or not, that is hacking." => ["Playfully", "something", "whether", "or", "that", "hacking"],
    "Copying all or parts of a program is as natural to a programmer as breathing, and as productive. It ought to be as free." => ["Copying", "or", "of", "program", "as", "to", "programmer", "breathing", "as", "It", "to", "as"],
  }.each do |sentence, words|
    specify "#{sentence.inspect} # => #{words.inspect}" do
      expect(alternate_words sentence).to eq words
    end
  end
end

