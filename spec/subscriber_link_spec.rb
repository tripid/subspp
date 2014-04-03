require 'spec_helper'

describe Subspp::SubscribeLink do
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

  specify :to_url do
    expect(subject.to_url).to eq "https://subs.pinpayments.com/test-site/subscribers/1/subscribe/55/juan-dela-cruz"
  end
end
