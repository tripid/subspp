require 'spec_helper'

describe Subspp::Subscriber do
  params =  { token: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
              site: 'merchant-test-site',
              customer_id: 3778 }

  subject { Subspp::Subscriber.load(params) }

  before do
    Subspp.configure do |config|
      config.site = 'merchant-test-site'
    end

    described_class.any_instance.stub(:retrieve).
      and_return( File.read('spec/fixtures/subscriber.xml') )
  end

  params.each do |key, value|
    specify :key do
      expect(subject.send(key)).to eq params[key]
    end
  end

  specify :url do
    expect(subject.url).
      to eq "https://subs.pinpayments.com/api/v4/merchant-test-site/subscribers/3778.xml"
  end

  specify :first_name do
    expect(subject.first_name).to eq 'Juan'
  end

  specify :last_name do
    expect(subject.last_name).to eq 'dela Cruz'
  end

  specify :active_until do
    expect(subject.active_until).to eq DateTime.new(2014, 1, 1, 0, 0)
  end

  specify :grace_until do
    expect(subject.grace_until).to be_instance_of DateTime
  end

  specify :email do
    expect(subject.email).to eq 'juan@example.com'
  end

  specify :recurring do
    expect(subject.recurring).to be_true
  end

  specify :store_credit do
    expect(subject.store_credit).to eq 0.0
  end

  describe '#expired_at' do
    it 'returns nil when there is no value' do
      expect(subject.expired_at).to be_nil
    end
  end

  describe '#subscribe?' do
    it 'returns true when still subscribed' do
      Time.stub(:now) { DateTime.new(2013, 1, 1) }
      expect(subject.subscribed?).to be_true
    end

    it 'returns false when subscription is passed' do
      Time.stub(:now) { DateTime.new(2014, 3, 1) }
      expect(subject.subscribed?).to be_false
    end
  end
end
