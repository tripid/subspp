require 'subspp'

describe Subspp do
  describe 'default' do
    it 'returns default site' do
      expect(Subspp.configuration.host).to eq 'https://subs.pinpayments.com'
    end

    it 'returns default api_version' do
      expect(Subspp.configuration.api_version).to eq 'v4'
    end

    it 'returns an empty plan_ids' do
      expect(Subspp.configuration.plan_ids).to eq({})
    end
  end

  describe '#configure' do
    before do
      Subspp.configure do |config|
        config.host        = 'https://test.pinpayments.com'
        config.site        = 'test-site'
        config.api_version = 'test version'
        config.token       = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        config.plan_ids    = { regular: 1, premium: 2 }
      end
    end

    specify :host do
      expect(Subspp.configuration.host).to eq 'https://test.pinpayments.com'
    end

    specify :site do
      expect(Subspp.configuration.site).to eq 'test-site'
    end

    specify :api_version do
      expect(Subspp.configuration.api_version).to eq 'test version'
    end

    specify :token do
      expect(Subspp.configuration.token).to eq 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    end

    specify :plan_ids do
      expect(Subspp.configuration.plan_ids).to eq ({ regular: 1, premium: 2 })
    end
  end
end
