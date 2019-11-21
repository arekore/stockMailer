require 'open-uri'

namespace :scraping do
    desc "Scraping stock data"
    task :update => :environment do

        url = 'https://kabuoji3.com/stock/2914/'
        charset = nil
        html = open(url) do |f|
            charset = f.charset
            f.read
        end

        data = Hash.new { |h,k| h[k] = [] }
        doc = Nokogiri::HTML.parse(html, nil, charset)
        doc.xpath('//*//*[@id="base_box"]/div/div[3]/div/div/div/table[1]/tbody[1]/tr/td').each do |node|
            data["2914"].push(node.inner_text)
        end
        puts data.inspect
        # {"2914"=>["2019-11-15", "2463", "2482", "2457.5", "2482", "4186900", "2482"]}
    end
end
