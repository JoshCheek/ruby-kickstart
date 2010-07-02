helpers do

  # pulled the auth methods straight from here http://www.sinatrarb.com/faq.html#auth
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth")
      throw(:halt, [401, "Not authorized\n"])
    end
  end
  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['josh', 'secret']
  end



  # escapes html, so that users can't drop html into your site in their comments
  def h(text)
    ERB::Util::h text
  end

  # takes text, and returns the first n words of that text
  # appends an elipsis to the end if there were more than n words
  def first_n_words( n , text )
    words = text.split[0...n]
    words.join(' ') + if words.size == n then '...' else '' end
  end
  
end

