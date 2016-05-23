require_relative '../spec_helper'

describe MailCatcher::API do
  describe 'configurable' do
    let(:server) { 'http://smtp.service.consul:8080' }

    describe '#configure' do
      it 'accept known config options' do
        server_initial = MailCatcher::API.config.server

        expect {
          MailCatcher::API.configure do |config|
            config.server = server
          end
        }.not_to raise_error

        expect(MailCatcher::API.config.server).not_to eq(server_initial)
        expect(MailCatcher::API.config.server).to eq(server)

        MailCatcher::API.reset_config
        expect(MailCatcher::API.config.server).to eq(server_initial)
      end

      it 'reject unknown config options' do
        expect {
          MailCatcher::API.configure do |config|
            config.unknown = server
          end
        }.to raise_error
      end
    end
  end
end
