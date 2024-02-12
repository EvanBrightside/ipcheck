# frozen_string_literal: true

RSpec.describe Ipcheck do
  let(:metadata_response) { File.read('spec/fixtures/metadata_response.xml') }
  let(:ip_address) { '8.8.8.8' }
  let(:url_ip_meta) { "http://ip-api.com/xml/#{ip_address}" }
  let(:url_my_ip) { 'https://api64.ipify.org' }
  let(:my_ip) { Ipcheck.my_ip }

  before do
    stub_request(:get, url_ip_meta).to_return(status: 200, body: metadata_response)
    stub_request(:get, url_my_ip).to_return(status: 200, body: ip_address)
  end

  subject { described_class.lookup(ip_address) }

  it 'has a version number' do
    expect(Ipcheck::VERSION).not_to be nil
  end

  it 'must return full metadata' do
    expect(subject).to be_a(Ipcheck::Metadata)
  end

  it 'must contains the following fields' do
    expect(subject.city).to eq('Ashburn')
    expect(subject.country).to eq('United States')
    expect(subject.countryCode).to eq('US')
    expect(subject.lat).to eq(39.03)
    expect(subject.lon).to eq(-77.5)
  end

  it 'must return correct ip address' do
    subject { described_class.lookup(ip_address) }

    expect(my_ip).to eq(ip_address)
  end
end
