class SendMailMailer < ApplicationMailer
    default from: 'Stock_Alerm@arka.siile'

    def send(address)
        @stocks = Stock.where(sendFlag: 1)
        @data = get_data(@stocks)
        mail(to: address, subject: "【定期】#{@data["date"].to_date.strftime("%m月%d日")} 株価")
    end

    private
    def get_data(stocks)
        retrun_data = Hash.new { |h,k| h[k] = [] }
        stocks.each do |itm|
            sleep(rand(1.0..2.0))
            url = "https://kabuoji3.com/stock/#{itm.code}/"
            charset = nil
            html = open(url) do |f|
                charset = f.charset
                f.read
            end

            doc = Nokogiri::HTML.parse(html, nil, charset)
            doc.xpath('//*//*[@id="base_box"]/div/div[3]/div/div/div/table[1]/tbody[1]/tr/td').each do |node|
                retrun_data[itm.code].push(node.inner_text[1..-1])
                retrun_data["date"] = node.inner_text[0]
            end
        end
        return retrun_data
    end
end
