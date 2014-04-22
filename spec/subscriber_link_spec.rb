require 'spec_helper'

describe Subspp::SubscribeLink do
  context 'attributes' do
    params = { site: 'test-site',
               plan_id: 55,
               customer_id: 1,
               screen_name: 'juan-dela-cruz' }

    subject { Subspp::SubscribeLink.new(params) }

    params.each do |key, value|
      specify key do
        expect(subject.send(key)).to eq params[key]
      end
    end
  end

  describe '#site' do
    let(:params) { { plan_id: 55,
                     customer_id: 1,
                     screen_name: 'Juan dela Cruz' } }


    it 'returns site from config' do
      Subspp.configure do |config|
        config.site = 'config-site'
      end
      subscribe_link = Subspp::SubscribeLink.new(params)
      expect(subscribe_link.site).to eq 'config-site'
    end

    it 'returns site from params' do
      params[:site] = 'this-site'
      subscribe_link = Subspp::SubscribeLink.new(params)
      expect(subscribe_link.site).to eq 'this-site'
    end
  end

  specify '#to_url' do
    subscribe_link = Subspp::SubscribeLink.new( site: 'test-site',
                                                plan_id: 55,
                                                customer_id: 1,
                                                screen_name: 'juan-dela-cruz' )
    expect(subscribe_link.to_url).to eq "https://subs.pinpayments.com/test-site/subscribers/1/subscribe/55/juan-dela-cruz"
  end
end
