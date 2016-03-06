require "cacoo2pdf/version"
require "rmagick"
require "faraday"
require "json"

module Cacoo2pdf
  def self.run(name, outdir, cacoo)
    Dir.mktmpdir do |tmpdir|
      Dir.chdir(tmpdir)

      conn = Faraday.new do |builder|
        builder.use Faraday::Adapter::NetHttp
      end

      queries = {apiKey: cacoo[:api_key]}

      response = conn.get "https://cacoo.com/api/v1/diagrams/#{cacoo[:diagram]}.json", queries

      json = JSON.load(response.body)


      imageUrls = json["sheets"].collect{ |sheet| sheet["imageUrlForApi"] }

      idx = 1
      imageUrls.collect do |url|
        res = conn.get url, queries

        File.open(format("%03d.png", idx), "wb") { |f| f.write(res.body) }
        idx += 1
      end

      filenames = Dir.entries(".").select { |n| n.match(/\d+\.png/) != nil }.sort
      imageList = Magick::ImageList.new(*filenames)

      Dir.chdir(outdir)
      imageList.write("#{name}.pdf")
    end
  end
end
