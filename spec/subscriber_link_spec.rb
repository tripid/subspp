require 'spec_helper'

describe Subspp::SubscribeLink do
  let(:params) { { site: 'test-site',
                   plan_id: 55,
                   customer_id: 1,
                   screen_name: 'juan-dela-cruz' } }

  subject { Subspp::SubscribeLink.new(params) }

  specify :plan_id do
    expect(subject.plan_id).to eq 55
  end

  specify :customer_id do
    expect(subject.customer_id).to eq 1
  end

  specify :screen_name do
    expect(subject.screen_name).to eq 'juan-dela-cruz'
  end

  specify :site do
    expect(subject.site).to eq 'test-site'
  end

  specify :to_url do
    expect(subject.to_url).to eq "https://subs.pinpayments.com/test-site/subscribers/1/subscribe/55/juan-dela-cruz"
  end
end
