require 'spec_helper'

describe Atm::Transaction do
  
  let(:described_class_instance) { described_class.new }

 it 'returns a Menu'  do
   described_class_instance.stub(:gets) { "q\n" }
   
   described_class_instance.stub(:process).and_return(nil)
   
   expect { described_class_instance.menu }.to output("\tD)deposit W)ithdraw B)alance Q)uite :").to_stdout	
 end

  context '#process' do
    it 'calls account deposit', :focus do
      described_class_instance.stub(:gets) { "d\n" }
      
      
  
      Atm::Account.any_instance.stub(:read_data)
      Atm::Account.any_instance.stub(:input_data)
      
      described_class_instance.account.should_receive(:deposit)

      described_class_instance.menu
      
      expect(described_class_instance.process).to eq 'd'
    end
  
    it 'returns a Menu' do
     described_class_instance.stub(:gets) { "q" }
     
     described_class_instance.menu
     
     expect { described_class_instance.process}.to output("\tThank you for using our service\n").to_stdout
   end
 end
 
end
