require 'uri'
require 'net/http'
class IposController < ApplicationController

    def index
        url = URI("https://stock.indianapi.in/ipo")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["X-Api-Key"] = ENV["STOCK_API"]
        response = http.request(request)
        @ipos = JSON.parse(response.body)
        
    end

    def show
        
    end
    def analysis
        download_pdf
        byebug
    end

    def download_pdf
        downloader = SebiPdfDownloader.new("https://www.sebi.gov.in/filings/public-issues/jan-2022/fabindia-limited_55532.html")
        @pdf_path = downloader.download_pdf
      
        if @pdf_path
          redirect_to @pdf_path
        else
          redirect_to ipos_path, alert: "PDF not found."
        end
    end
end
