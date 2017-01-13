helpers do
  def html_escaper(text)
    Rack::Utils.escape_html(text)
  end
end
