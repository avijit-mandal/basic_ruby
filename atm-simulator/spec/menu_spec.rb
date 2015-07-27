require './menu'
require './atm'

describe Menu do
 it 'returns a Menu' do
   expect { Menu.new.choices }.to output("D)deposite W)ithdraw B)alance Q)uite").to_stdout	
 end

 it 'returns "You are going to deposit"' do
  expect(Menu.new.choices('D')).to eq "You are going to deposit"
 end
end
