require 'redcarpet'

class PageController < HK::Controller
  def show
    parts = @request.path.split('/')
    parts.shift
    section = nil
    if parts.length > 1
      section = parts.shift
    end
    file = 'pages/' + (section.nil? ? '' : section + '/') + parts.join('_') + '.md'
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    puts section
    puts file
    if File.exist?(file)
      @content = markdown.render(File.read(file))
    else
      @content = markdown.render(File.read('pages/index.md'))
    end
    render 'show'
  end
end
