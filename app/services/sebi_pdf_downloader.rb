require 'capybara'

class SebiPdfDownloader

  def initialize(sebi_url)
    @sebi_url = sebi_url
  end

  def download_pdf
    byebug
    Capybara.current_session.visit(@sebi_url)
    
    # Wait for any dynamic content (adjust as needed)
    sleep 2 unless has_link?('.pdf', wait: 5)  # quick wait

    # Find the first link containing a PDF
    pdf_link = all('a').find { |a| a[:href]&.include?('.pdf') }&.[](:href)

    return nil unless pdf_link

    # Handle relative URLs
    full_url = URI.join(@sebi_url, pdf_link).to_s
    file_name = File.basename(URI.parse(full_url).path)

    # Save to public/pdfs/
    save_path = Rails.root.join('public', 'pdfs', file_name)

    File.open(save_path, 'wb') do |file|
      file.write(URI.open(full_url).read)
    end

    "/pdfs/#{file_name}"  # for use in your views
  end
end
