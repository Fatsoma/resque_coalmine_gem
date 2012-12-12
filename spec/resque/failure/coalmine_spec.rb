describe Resque::Failure::Coalmine do

  describe '.configure block' do
    let(:signature) { 'my_secret_signature' }
    before do
      Resque::Failure::Coalmine.configure do |config|
        config.signature = signature
      end
    end
    subject { ::Coalmine.config }
    it "sets signature" do
      expect(Coalmine.config.signature).to eql signature
    end
  end

  describe "#count" do
    let(:failed) { 0 }
    before  { Resque::Stat.expects(:[]).with(:failed).returns(failed) }
    it 'should be zero' do
      expect(Resque::Failure::Coalmine.count).to eq 0
    end
  end

  describe "#save" do
    let(:exception) { StandardError.new("ka boom") }
    let(:worker) { Resque::Worker.new(:coalmine) }
    let(:queue) { "coalmine" }
    let(:klass) { Object }
    let(:args) { 2012 }
    let(:payload) { {'class' => klass, 'args' => args } }
    let(:backend) { Resque::Failure::Coalmine.new(exception, worker, queue, payload) }

    it "notifies coaline with exception" do
      Coalmine.expects(:notify).with(exception)
      backend.save
    end

    describe Coalmine do
      subject { Coalmine.custom_variables }
      it 'has custom variables set "payload_class: Object", "payload_args: 2012"' do
        expect(subject[:payload_class]).to eq payload['class']
        expect(subject[:payload_args]).to eq payload['args'].inspect
      end
    end
  end

end
