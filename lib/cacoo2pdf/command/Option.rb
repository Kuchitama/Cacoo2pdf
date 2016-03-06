module Cacoo2pdf
  class Command
    module Options
      def self.parse!(argv)
        options = {
          output: Dir.pwd,
          cacoo: {
            api_key: ENV["CACOO_API_KEY"]
          }
        }

        parser = OptionParser.new do |opt|
          opt.on_head('-n', '--name=VAL', 'output file name') { |v| options[:name] = v }
          opt.on('-o', '--output=VAL') { |v| options[:output] = v }

          opt.on_head('-d', '--diagram=VAL', 'cacoo diagram id') { |v| options[:cacoo][:diagram] = v }
          opt.on('-k', '--api-key=VAL', 'cacoo api key') { |v| options[:cacoo][:api_key] = v }
        end

        parser.parse! argv

        options
      end

    end
  end
end