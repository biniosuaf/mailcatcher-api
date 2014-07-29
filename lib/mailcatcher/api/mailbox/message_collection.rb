module MailCatcher
  module API
    class Mailbox
      class MessageCollection
        include Enumerable

        def initialize
          @connection = Faraday.new(url: MailCatcher::API.config.server) do |faraday|
            faraday.request :network_exception
            faraday.adapter :net_http
          end
          @collection = load_collection
        end

        def each &block
          collection.each do |msg|
            yield(msg)
          end
          nil
        end

        private

        def collection
          @collection ||= load_collection
        end

        def load_collection
          collection_index.map do |msg|
            response = @connection.get("/messages/#{ msg['id'] }.json")
            Mailbox::Message.new(MultiJson.load(response.body))
          end
        end

        def collection_index
          @collection_index ||= load_collection_index.sort { |a, b| b['id'] <=> a['id'] }
        end

        def load_collection_index
          MultiJson.load(@connection.get('/messages').body)
        end
      end
    end
  end
end
