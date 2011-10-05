module Jekyll
  class NavLinkTag < Liquid::Block

    def initialize(tag_name, params, tokens)
      super
      @params = params.split(' ')
      @url = @params.first
    end

    def render(context)
      page_url = context.environments.first["page"]["url"]
      puts "XXXX #{page_url}"
      "<li>" +
      ((@url != page_url) ? "<a href=\"#{@url}\">" : '') +
      super.join('') +
      ((@url != page_url) ? "</a>" : "") +
      "</li>"
    end
  end
end

Liquid::Template.register_tag('nav_link', Jekyll::NavLinkTag)