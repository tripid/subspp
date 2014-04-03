require 'spec_helper'

describe Subspp::Subscriber do
  let(:params) { { token: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    site: 'merchant-test-site',
    customer_id: 3778 } }

  subject { Subspp::Subscriber.load(params) }

  before do
    described_class.any_instance.stub(:retrieve).
      and_return( File.read('spec/fixtures/subscriber.xml') )
  end

  specify :token do
    expect(subject.token).to eq params[:token]
  end

  specify :site do
    expect(subject.site).to eq params[:site]
  end

  specify :customer_id do
    expect(subject.customer_id).to eq params[:customer_id]
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

  specify :email do
    expect(subject.email).to eq 'juan@example.com'
  end
end
