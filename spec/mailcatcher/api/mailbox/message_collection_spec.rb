require_relative '../../../spec_helper'

describe MailCatcher::API::Mailbox::MessageCollection do
  include MailboxSpecHelpers

  let(:collection) { MailCatcher::API::Mailbox::MessageCollection.new }

  before { stub_mailbox }
  after { unstub_mailbox }

  it 'enumerable' do
    expect(collection).to be_an(Enumerable)
    expect(collection).to respond_to :each
    expect(collection).to respond_to :count
    expect(collection).to respond_to :sort
    expect(collection).to respond_to :grep
    expect(collection).to respond_to :select
  end

  it 'sorted' do
    stub_mailbox(10)
    actual_index_ids = @mailbox_email_index.map {|msg| msg['id']}
    mailbox_message_ids = mailbox.messages.map(&:id)
    expect(mailbox_message_ids).not_to eql(actual_index_ids)
    expect(mailbox_message_ids).to eql(actual_index_ids.sort.reverse)
  end

  it 'count' do
    [4, 6].each do |num|
      stub_mailbox(num)
      expect(mailbox.messages(reload: true).count).to be num
    end
  end

  it 'clear all' do
    stub_mailbox(3)
    expect(mailbox.messages(reload: true).count).to be 3
    mailbox.clear_all_messages
    expect(mailbox.messages(reload: true).count).to be 0
  end
end
